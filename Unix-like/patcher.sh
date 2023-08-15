#!/usr/bin/env bash

sharpii="https://noahpistilli.github.io/RC24_Patcher/Sharpii"
wiiwarepatcher="https://github.com/RiiConnect24/WiiWare-Patcher/raw/master/bin/wiiwarepatcher"
lzx="https://github.com/RiiConnect24/WiiWare-Patcher/raw/master/bin/lzx"

# Detect architecture to download the correct binary for sharpii, lzx and wiiwarepatcher
kernel="$(uname -s)"
case $(uname -m) in
	arm*|aarch*)
		arch="arm";;
	x86_64)
		arch="amd64";;
	i386)
		arch="i386";;

	*)
		printf "Probably unrecognized architecture \"$(uname -m)\".\n"
		exit;;
esac

case $(uname -m),$(uname) in
 	x86_64,Darwin|arm64,Darwin)
 		sys="macOS-x64";;
	x86_64,*)
		sys="linux-x64";;
	aarch64,*)
		sys="linux-arm64";;
	*,*)
		sys="linux-arm";;
	x86_32,*)
		printf "The x86_32 architecture is not supported by Sharpii.\n"
		exit;;
esac

download_tool() {
	if [[ ! -e ${2} ]]; then
		if ! command -v curl &> /dev/null
		then
			printf "Please install curl using your system's package manager.\n"
			printf "Optionally, you can download ${1} and save it as $(pwd)/${2} .\n"
			printf "(If you actually do this, expect to get this 2 more times)\n"
			exit
		fi
		printf "* Downloading ${2}...\n"
		curl -sL ${1} -o ${2}
	else
		printf "* ${2} appears to exist; not downloading.\n"
	fi
	if [[ ! -x ${2} ]]; then chmod +x ${2}; fi
}

download_tool "$sharpii/sharpii($sys)" Sharpii
download_tool "$lzx-$kernel-$arch" lzx
download_tool "$wiiwarepatcher-$kernel-$arch" wiiwarepatcher

if ! ls *.wad >/dev/null 2>&1
then
	printf "There are no wads to patch. Put some in the same directory as the script.\n"
	if [[ ! -e patcher.sh ]]; then
		printf "\nNote: The patcher doesn't appear to be here ($(pwd)) either.\n"
		printf "You must place your wad files in there, or change to the patcher's directory, then try again.\n"
    fi
    exit
fi


mkdir -p "wiimmfi-wads"
mkdir -p "backup-wads"

for f in *.wad; do
    echo "Processing $f..."
    echo "Making backup..."
    cp "$f" "backup-wads"
    echo "Patching... This might take a second."
    ./Sharpii wad -u "$f" "temp"
    pushd temp >/dev/null
    ../wiiwarepatcher
    popd
    rm "$f" >/dev/null
    ./Sharpii wad -p "temp" "./wiimmfi-wads/${f%%.wad} (Wiimmfi)"
    rm -r temp
done

printf "Done\n\n"
printf "The wads are patched. They're in the wiimmfi-wads directory\n"
printf "The original wads are in backup-wads.\n"
printf "Thank you for using the Auto WiiWare Patcher.\n"
