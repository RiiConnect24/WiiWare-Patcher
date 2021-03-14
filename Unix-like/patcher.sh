#!/usr/bin/env bash


sharpii="https://github.com/RiiConnect24/WiiWare-Patcher/raw/master/bin/sharpii"
wiiwarepatcher="https://github.com/RiiConnect24/WiiWare-Patcher/raw/master/bin/wiiwarepatcher"
lzx="https://github.com/RiiConnect24/WiiWare-Patcher/raw/master/bin/lzx"

#Needed for Sharpii on i386 systems
libwiisharp="https://github.com/RiiConnect24/WiiWare-Patcher/raw/master/bin/libwiisharp.dll"

#detect architecture to download the correct binary for sharpii, lzx and wiiwarepatcher
if [[ -z "$(uname -s | grep 'Darwin')" ]]; then
    kernel="$(uname -s)"
    if [[ -n "$(uname -m | grep 'arm*\|aarch*')" ]]; then
        arch="arm"
    elif [[ -n "$(uname -m | grep 'x86_64')" ]]; then
        arch="amd64"
    elif [[ -n "$(uname -m | grep 'i386')" ]]; then
        arch="i386"
    else
        printf "Unable to use your architecture: $(uname -m)\n$helpmsg\n"; exit
    fi
else
    kernel="$(uname -s)" # darwin
    arch="amd64" # will update this when ARM MacBooks come around. (written April 2020)
    # macOS uses mach-o binaries, so the same one can be used for both arm, and amd64 (written Feburary 2020)
    # I'm too lazy to change the code further down when it makes no difference
fi

download() {
    command -v curl > /dev/null
    if [[ $? -eq 1 ]]; then printf "install curl using a package manager to use this script"; exit; fi

    if [[ -e sharpii || -e sharpii/sharpii ]]; then
        printf "* Sharpii appears to exist. Not downloading.\n"
    else
        printf "* Downloading Sharpii for $kernel $arch...\n"
        if [[ $arch -ne "i386" ]]; then curl -sL "$sharpii-$kernel-$arch" -o sharpii; fi

	if [[ $arch -eq "i386" ]]; then mkdir sharpii; fi
        if [[ $arch -eq "i386" ]]; then curl -sL "$sharpii-$kernel-$arch" -o sharpii/sharpii; fi
	if [[ $arch -eq "i386" ]]; then curl -sL "$libwiisharp" -o sharpii\\libwiisharp.dll; fi
    fi
    if [[ -e lzx ]]; then
        printf "* LZX appears to exist. Not downloading.\n"
    else
        printf "* Downloading LZX\n"
        curl -sL "$lzx-$kernel-$arch" -o lzx
    fi
    if [[ -e wiiwarepatcher ]]; then
        printf "* wiiwarepatcher appears to exist. Not downloading.\n"
    else
        printf "* Downloading wiiwarepatcher\n"
        curl -sL $wiiwarepatcher-$kernel-$arch -o wiiwarepatcher
    fi
    [[ ! -x lzx ]] && chmod +x lzx || true
    if [[ $arch -ne "i386" ]]; then [[ ! -x sharpii ]] && chmod +x sharpii || true; fi
    if [[ $arch -eq "i386" ]]; then [[ ! -x sharpii/sharpii ]] && chmod +x sharpii/sharpii || true; fi
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
    if [[$arch -nq "i386"]]; then ./sharpii WAD -u "$f" "temp"
    if [[$arch -eq "i386"]]; then sharpii/sharpii WAD -u "$f" "temp"
    mv ./temp/00000001.app 00000001.app
    ./wiiwarepatcher
    mv 00000001.app ./temp/00000001.app
    rm "$f"
    if [[$arch -ne "i386"]]; then ./sharpii WAD -p "temp" "./wiimmfi-wads/${f%%.wad}-Wiimmfi"
    if [[$arch -eq "i386"]]; then sharpii/sharpii WAD -p "temp" "./wiimmfi-wads/${f%%.wad}-Wiimmfi"
    rm -r temp
done

printf "Done\n\n"
printf "The wads are patched. They're in the wiimmfi-wads directory\n"
printf "The original wads are in backup-wads.\n"
printf "Thank you for using the Auto WiiWare Patcher.\n"
