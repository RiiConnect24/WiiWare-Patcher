#!/usr/bin/env bash


sharpii="https://github.com/RiiConnect24/auto-wiiware-patcher/raw/master/bin/sharpii"
wiiwarepatcher="https://github.com/RiiConnect24/auto-wiiware-patcher/raw/master/src/wiiwarepatcher.cpp"
lzx="https://github.com/RiiConnect24/auto-wiiware-patcher/raw/master/src/lzx.c"

#detect architecture to download the correct Sharpii binary
if [[ -z "$(uname -s | grep 'Darwin')" ]]; then
    kernel="$(uname -s)"
    if [[ -n "$(uname -m | grep 'arm*\|aarch*')" ]]; then
        arch="arm"
    elif [[ -n "$(uname -m | grep 'x86_64')" ]]; then
        arch="amd64"
    else
        printf "Unable to use your architecture: $(uname -m)\n$helpmsg\n"; exit
    fi
else
    kernel="$(uname -s)" # darwin
    arch="amd64" # will update this when ARM MacBooks come around. (written April 2020)
fi


download() {
    command -v curl > /dev/null
    if [[ $? -eq 1 ]]; then printf "install curl using a package manager to use this script"; exit; fi
    command -v cc > /dev/null
    if [[ $? -eq 1 ]]; then printf "you need a C compiler to use this script"; exit; fi
    command -v c++ > /dev/null
    if [[ $? -eq 1 ]]; then printf "you need a C++ compiler to use this script"; exit; fi


    if [[ -e sharpii ]]; then
        printf "* Sharpii appears to exist. Not downloading.\n"
    else
        printf "* Downloading Sharpii for $kernel $arch...\n"
        curl -sL "$sharpii-$kernel-$arch" -o sharpii
    fi
    if [[ -e lzx ]]; then
        printf "* LZX appears to exist. Not downloading.\n"
    else
        printf "* Downloading LZX\n"
        curl -sL $lzx -o lzx.c
        printf "* Compiling LZX\n"
        cc lzx.c -o lzx
    fi
    if [[ -e wiiwarepatcher ]]; then
        printf "* wiiwarepatcher appears to exist. Not downloading.\n"
    else
        printf "* Downloading wiiwarepatcher\n"
        curl -sL $wiiwarepatcher -o wiiwarepatcher.cpp
	printf "* Compiling wiiwarepatcher\n"
	c++ wiiwarepatcher.cpp -o wiiwarepatcher
    fi
    [[ ! -x lzx ]] && chmod +x lzx || true
    [[ ! -x sharpii ]] && chmod +x sharpii || true
    [[ ! -x wiiwarepatcher ]] && chmod +x wiiwarepatcher || true
}

download

if [ ! -f *.wad ]
then
    printf "There are no wads to patch. Put some in the same directory as the script.\n"; exit
fi


mkdir -p "wiimmfi-wads"
mkdir -p "backup-wads"

for f in *.wad
do
    echo "Processing $f..."
    echo "Making backup..."
    cp "$f" "backup-wads"
    echo "Patching... This might take a second."
    ./sharpii WAD -u "$f" "temp"
    mv ./temp/00000001.app 00000001.app
    ./wiiwarepatcher
    mv 00000001.app ./temp/00000001.app
    rm "$f"
    ./sharpii WAD -p "temp" "./wiimmfi-wads/${f}-Wiimmfi"
    rm -r temp
done

printf "Done\n\n"
printf "The wads are patched. They're in the wiimmfi-wads directory\n"
printf "The original wads are in backup-wads.\n"
printf "Thank you for using the Auto WiiWare Patcher.\n"
