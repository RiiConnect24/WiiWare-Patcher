#include <iostream>
#include <fstream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef _WIN32
#include <winsock2.h>
#else
#include <arpa/inet.h>
#endif

using namespace std;

// Wiimmfi security update
static inline int GetOpcode(unsigned int* instructionAddr)
{
    return ((ntohl(*instructionAddr) >> 26) & 0x3f);
}

static inline int GetImmediateDataVal(unsigned int* instructionAddr)
{
    return (ntohl(*instructionAddr) & 0xffff);
}

static inline int GetLoadTargetReg(unsigned int* instructionAddr)
{
    return (int)((ntohl(*instructionAddr) >> 21) & 0x1f);
}

static inline int GetComparisonTargetReg(unsigned int* instructionAddr)
{
    return (int)((ntohl(*instructionAddr) >> 16) & 0x1f);
}

// The code inside this function (do_new_wiimmfi) has been written by MrBean35000vr and Leseratte, 
// for the Wiimmfi project. Please do not edit it, especially not the parts actually performing the patching,
// if you don't know what you're doing. If in doubt, please contact Leseratte.
int do_new_wiimmfi(char *addr, int len) {


    int hasGT2Error = 0;
    unsigned char gt2locator[] = { 0x38, 0x61, 0x00, 0x08, 0x38, 0xA0, 0x00, 0x14};        
    // Opcode list for p2p: 
    unsigned char opCodeChainP2P_v1[22] =    { 32, 32, 21, 21, 21, 21, 20, 20, 31, 40, 21, 20, 20, 31, 31, 10, 20, 36, 21, 44, 36, 16 };
    unsigned char opCodeChainP2P_v2[22] =    { 32, 32, 21, 21, 20, 21, 20, 21, 31, 40, 21, 20, 20, 31, 31, 10, 20, 36, 21, 44, 36, 16 };

    // Opcode list for MASTER: 
    unsigned char opCodeChainMASTER_v1[22] = { 21, 21, 21, 21, 40, 20, 20, 20, 20, 31, 31, 14, 31, 20, 21, 44, 21, 36, 36, 18, 11, 16 };
    unsigned char opCodeChainMASTER_v2[22] = { 21, 21, 21, 21, 40, 20, 20, 20, 20, 31, 31, 14, 31, 20, 21, 36, 21, 44, 36, 18, 11, 16 };
    
    char * MASTERopcodeChainOffset = 0;

    char * cur = addr; 
    const char * end = addr + len; 

    // Check if the game needs the new patch. 
    do {
        if (memcmp(cur, "<GT2> RECV-0x%02x <- [--------:-----] [pid=%u]", 0x2e) == 0) 
        {
            hasGT2Error++;
        }
    } while (++cur < end); 

    cur = addr; 

    if (hasGT2Error > 1) return 1; 	// error, this either doesn't exist, or exists once. Can't exist multiple times. 

    int successful_patch_p2p = 0; 
    int successful_patch_master = 0;


    do {

        // Patch the User-Agent so Wiimmfi knows this game has been patched. 
        // Note: The letter and the first digit in this User-Agent specifies which patcher patched the WiiWare game.
        // Please leave that as is ("J-1") and do not change this without talking to Leseratte beforehand.
        if (memcmp(cur, "User-Agent\x00\x00RVL SDK/", 20) == 0) {

            if (hasGT2Error) 
                memcpy(cur + 12, "J-1-1\x00", 6); 
            else
                memcpy(cur + 12, "J-1-0\x00", 6); 
            
        }

        if (hasGT2Error)
        {
            if (memcmp(cur, &gt2locator, 8) == 0)
            {
                int found_opcode_chain_P2P_v1 = 1; 
                int found_opcode_chain_P2P_v2 = 1; 
    
                    for (int i = 0; i < 22; i++) {
                        int offset = (i * 4) + 12;
                        if (opCodeChainP2P_v1[i] != (unsigned char)(GetOpcode((unsigned int *)(cur + offset)))) {
                            found_opcode_chain_P2P_v1 = 0; 
                        }
                        if (opCodeChainP2P_v2[i] != (unsigned char)(GetOpcode((unsigned int *)(cur + offset)))) {
                            found_opcode_chain_P2P_v2 = 0; 
                        }
                    }
                    int found_opcode_chain_MASTER;
                    for (int dynamic = 0; dynamic < 40; dynamic += 4) {
                        found_opcode_chain_MASTER = 1; 
                        int offset = 0; 
                        for (int i = 0; i < 22; i++) {
                            offset = (i * 4) + 12 + dynamic;
                            if (
                                (opCodeChainMASTER_v1[i] != (unsigned char)(GetOpcode((unsigned int *)(cur + offset)))) && 
                                (opCodeChainMASTER_v2[i] != (unsigned char)(GetOpcode((unsigned int *)(cur + offset))))
                            ) {
                                found_opcode_chain_MASTER = 0; 
                            }
                        }

                        if (found_opcode_chain_MASTER) {
                            MASTERopcodeChainOffset = (cur + 12 + dynamic);
                            break;
                        }

                    }
                    if (found_opcode_chain_P2P_v1 || found_opcode_chain_P2P_v2) {

                        if (
                            GetImmediateDataVal((unsigned int *)(cur + 0x0c)) == 0x0c && 
                            GetImmediateDataVal((unsigned int *)(cur + 0x10)) == 0x18 &&
                            GetImmediateDataVal((unsigned int *)(cur + 0x30)) == 0x12 &&
                            GetImmediateDataVal((unsigned int *)(cur + 0x48)) == 0x5a &&
                            GetImmediateDataVal((unsigned int *)(cur + 0x50)) == 0x0c && 
                            GetImmediateDataVal((unsigned int *)(cur + 0x58)) == 0x12 && 
                            GetImmediateDataVal((unsigned int *)(cur + 0x5c)) == 0x18 && 
                            GetImmediateDataVal((unsigned int *)(cur + 0x60)) == 0x18
                        )
                        {								
                            int loadedDataReg = GetLoadTargetReg((unsigned int *)(cur + 0x14));
                            int comparisonDataReg = GetComparisonTargetReg((unsigned int *)(cur + 0x48));
                            
                            if (found_opcode_chain_P2P_v1) {
                                
                                *(int *)(cur + 0x14) = htonl(0x88010011 | (comparisonDataReg << 21)); 
                                *(int *)(cur + 0x18) = htonl(0x28000080 | (comparisonDataReg << 16)); 
                                *(int *)(cur + 0x24) = htonl(0x41810064);   
                                *(int *)(cur + 0x28) = htonl(0x60000000);                               
                                *(int *)(cur + 0x2c) = htonl(0x60000000);                               
                                *(int *)(cur + 0x34) = htonl(0x3C005A00 | (comparisonDataReg << 21)); 
                                *(int *)(cur + 0x48) = htonl(0x7C000000 | (comparisonDataReg << 16) | (loadedDataReg << 11)); 
                                successful_patch_p2p++;
                            }
                            if (found_opcode_chain_P2P_v2) {
                                
                                *(int *)(cur + 0x14) = htonl(0x88010011 | (comparisonDataReg << 21)); 
                                *(int *)(cur + 0x18) = htonl(0x28000080 | (comparisonDataReg << 16)); 
                                *(int *)(cur + 0x1c) = htonl(0x41810070); 
                                *(int *)(cur + 0x24) = *(int *)(cur + 0x28); 
                                *(int *)(cur + 0x28) = htonl(0x8001000c | (loadedDataReg << 21)); 
                                *(int *)(cur + 0x2c) = htonl(0x3C005A00 | (comparisonDataReg << 21)); 
                                *(int *)(cur + 0x34) = htonl(0x7c000000 | (comparisonDataReg << 16) | (loadedDataReg << 11)); 
                                *(int *)(cur + 0x48) = htonl(0x60000000); 
                                successful_patch_p2p++;
                            }

                        }
                    }

                    else if (found_opcode_chain_MASTER) {

                        if (
                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x10)) == 0x12 &&
                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x2c)) == 0x04 &&
                            
                            (
                            
                            (GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x3c)) == 0x12 && 
                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x44)) == 0x0c) ||

                            (GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x3c)) == 0x0c && 
                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x44)) == 0x12)

                            ) &&

                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x48)) == 0x18 &&
                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x50)) == 0x00 &&
                            GetImmediateDataVal((unsigned int *)(MASTERopcodeChainOffset + 0x54)) == 0x18
                        )
                        {
                            int rY = GetComparisonTargetReg((unsigned int *)MASTERopcodeChainOffset); 
                            int rX = GetLoadTargetReg((unsigned int *)MASTERopcodeChainOffset);       

                            *(int *)(MASTERopcodeChainOffset + 0x00) = htonl(0x38000004 | (rX << 21));
                            *(int *)(MASTERopcodeChainOffset + 0x04) = htonl(0x7c00042c | (rY << 21) | (3 << 16) | (rX << 11));
                            *(int *)(MASTERopcodeChainOffset + 0x14) = htonl(0x9000000c | (rY << 21) | (1 << 16));
                            *(int *)(MASTERopcodeChainOffset + 0x18) = htonl(0x88000011 | (rY << 21) | (1 << 16));
                            *(int *)(MASTERopcodeChainOffset + 0x28) = htonl(0x28000080 | (rY << 16));
                            *(int *)(MASTERopcodeChainOffset + 0x38) = htonl(0x60000000);
                            *(int *)(MASTERopcodeChainOffset + 0x44) = htonl(0x41810014);
                            successful_patch_master++;

                        }
                    }
            }
        }


    } while (++cur < end); 

    if (hasGT2Error) {
        if (successful_patch_p2p == 0) {
            return 2; 
        }
    }

    return 0;

}


size_t find_string_in_buf(unsigned char *buf, size_t len, size_t offset, const char *s)
{
    long i, j;
    int slen = strlen(s);
    long imax = len - slen - 1;
    long ret = -1;
    bool match;

    for(i = 0+offset; i < imax; i++) {
        match = true;

        for(j=0; j<slen; j++) {
            if(buf[i+j] != s[j]) {
                match = false;
                break;
            }
        }

        if(match) {
            ret = i;
            break;
        }
    }

    return ret;
}

size_t Filesize(ifstream &file) {
    file.seekg(0, std::ios::end);
    size_t len = file.tellg();
    file.seekg(0, std::ios_base::beg);

    return len;
}

void ReplaceURLs(char *buffer, size_t len) {
    size_t pos = 0;
    int cnt = 0;

    string url;

    while(1) {
        // Find all urls starting with https
        pos = find_string_in_buf((unsigned char*)buffer, len, pos, "https://");
        if(pos < len-1) {
            int idx = 0;
            url = "";

            // copy url from buffer into string
            while(1) {
                url.push_back(buffer[pos+idx]);
                idx++;

                if(buffer[pos+idx] == '\0') {
                    // end of url
                    break;
                }
            }

            // get original length
            size_t len_url = url.size();

            // https -> http
            url.erase(4, 1);

            // replace nintendo url with wiimm url
            size_t p = url.find("nintendowifi.net");
            if(p != string::npos) {
                url.replace(p, 16, "wiimmfi.de");
            }

            // Fill up string with NULL until original length is reached
            while(url.size() < len_url) {
                url.push_back('\0');
            }

            // Copy modified url back to buffer
            strncpy(&buffer[pos], url.c_str(), url.size());
            cnt++;

        } if(pos >= len-1) {
            // end of buffer
            break;
        }
        pos++;
    }
    cout << "Replaced " << cnt << " https-URLs." << endl;

    cnt = 0;
    pos = 0;
    while(1) {
        // find all urls without https
        pos = (size_t)find_string_in_buf((unsigned char*)buffer, len, pos, "nintendowifi.net");
        if(pos < len-1) {
            int idx = 0;
            url = "";

            // copy url from buffer into string
            while(1) {
                url.push_back(buffer[pos+idx]);
                idx++;

                if(buffer[pos+idx] == '\0') {
                    // end of url
                    break;
                }
            }

            // get original length
            size_t len_url = url.size();

            // replace nintendo url with wiimm url
            url.replace(0, 16, "wiimmfi.de");

            // Fill up string with NULL until original length is reached
            while(url.size() < len_url) {
                url.push_back('\0');
            }

            // Copy modified url back to buffer
            strncpy(&buffer[pos], url.c_str(), url.size());
            cnt++;

        } if(pos >= len-1) {
            // end of buffer
            break;
        }
        pos++;
    }
    cout << "Replaced " << cnt << " other URLs." << endl;
}


int main(int argc, char * argv[])
{
    cout << "WiiWare Patcher 0.2" << endl;

    string filename = "00000001.app";

    if (argc == 2) {
        filename = argv[1];
    }

    cout << "Using file " << filename << endl;


    ifstream file(filename, std::ifstream::binary);    
    
    if(!file.is_open()) {
        cerr << "Failed to open 00000001.app" << endl;
#ifdef _WIN32
        cerr << "Are you trying to run auto-wiiware-patcher? Please run WiiWarePatcher.bat instead." << endl;
        system("pause");
#else
        cerr << "Are you trying to run auto-wiiware-patcher? Please run patcher.sh instead." << endl;
#endif

        return -1;
    }

    // First, check if the 1st byte is 0x11 or 0x40. If it is, it's LZX-compressed and we
    // need to decompress and later compress it again. 

    char * testbuffer = new char[4];
    file.read(testbuffer, 4);

    bool compressed = false;
    int ret = 0;

    if (testbuffer[0] == 0x11 || testbuffer[0] == 0x40) {
        cout << "This looks like a compressed file. Let's remember that, and start decompressing." << endl;
        compressed = true;

        // Decode file
        #ifdef _WIN32
            ret = system(("lzx.exe -d " + filename).c_str());
        #else
            ret = system(("./lzx -d " + filename).c_str());
        #endif

        if(ret != 0) {
            cerr << "Failed to decode " << filename << endl;
            cerr << "Are you sure that a program called lzx is in this directory?" << endl;
            #ifdef _WIN32
                system("pause");
            #endif
            return -2;
        }
        cout << "Exit code: " << ret << endl << endl;

    }
    else {
        cout << "This does not look compressed" << endl;
    }

    // Get file size
    size_t len = Filesize(file);
    char *buffer = new char[len];

    // Read file into buffer
    file.read(buffer, len);
    if(!file) {
        cerr << "Error: only " << file.gcount() << " could be read.";
        file.close();
        delete buffer;
#ifdef _WIN32
        system("pause");
#endif
        return -3;
    }
    file.close();

    cout << "Replacing strings..." << endl;
    ReplaceURLs(buffer, len);

    cout << "Wiimmfi security patch..." << endl;

    if (do_new_wiimmfi(buffer, len) != 0) {
        cout << "Patching WiiWare for Wiimmfi failed!" << endl;
        return -5;
    }


    // Save patched file
    ofstream ofile(filename, std::ifstream::binary);
    if(!ofile.is_open()) {
        cerr << "Failed to open " << filename << endl;
#ifdef _WIN32
        system("pause");
#endif
        return -4;
    }
    ofile.write(buffer, len);
    ofile.close();

    delete buffer;

    // If the file was compressed before, compress it again.

    if (compressed) {

        cout << "Compress file ..." << endl;

        // Encode File
        #ifdef _WIN32
            ret = system(("lzx.exe -evb " + filename).c_str());
        #else
            ret = system(("./lzx -evb " + filename).c_str());
        #endif
        if(ret != 0) {
            cerr << "Failed to encode " << filename << endl;
            cerr << "Are you sure that a program called lzx is in this directory?" << endl;
            #ifdef _WIN32
                system("pause"); 
            #endif
            return -4;
        }
        cout << "Exit code: " << ret << endl;

    }


    return 0;
}
