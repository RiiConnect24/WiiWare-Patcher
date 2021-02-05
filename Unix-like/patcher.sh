#!/usr/bin/env bash

download() {
    if [[ -e sharpii ]]; then
        printf "* Sharpii appears to exist. Not downloading.\n"
    else
        printf "* Downloading Sharpii for $kernel $arch...\n"
        curl -sL "$sharpii$kernel-$arch" -o sharpii
    fi
    if [[ -e lzx ]]; then
        printf "* LZX appears to exist. Not downloading.\n"
    else
        printf "* Downloading LZX"
        curl -sL https://github.com/RiiConnect24/auto-wiiware-patcher/raw/master/src/lzx.c -o lzx.c
        printf "* Compiling LZX"
        cc lzx.c -o lzx
    fi
    if [[ -e wiiwarepatcher ]]; then
        printf "* wiiwarepatcher appears to exist. Not downloading.\n"
    else
        printf "* Downloading wiiwarepatcher\n"
        curl -sL https://github.com/RiiConnect24/auto-wiiware-patcher/raw/master/src/wiiwarepatcher.cpp -o wiiwarepatcher.cpp
	c++ wiiwarepatcher.cpp -o wiiwarepatcher
    fi
    [[ ! -x lzx ]] && chmod +x lzx || true
    [[ ! -x sharpii ]] && chmod +x sharpii || true
    [[ ! -x wiiwarepatcher ]] && chmod +x wiiwarepatcher || true
    cd ..
}

deps
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
    wiiwarepatcher
    mv 00000001.app ./temp/00000001.app
    rm "$f"
    ./sharpii WAD -p "temp" "./wiimmfi-wads/${f}-Wiimmfi"
    rm -r temp
done

printf "Done\n\n"
printf "The wads are patched. They're in the wiimmfi-wads directory\n"
printf "The original wads are in backup-wads.\n"
printf "Thank you for using the Auto WiiWare Patcher.\n"
