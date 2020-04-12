#! /bin/bash

lzx="https://github.com/KcrPL/KcrPL.github.io/raw/master/Patchers_Auto_Update/WiiWare-Patcher_Linux/lzx-"
wiiwarepatcher="https://github.com/KcrPL/KcrPL.github.io/raw/master/Patchers_Auto_Update/WiiWare-Patcher_Linux/WiiwarePatcher-"
sharpii="https://github.com/KcrPL/KcrPL.github.io/raw/master/Patchers_Auto_Update/WiiWare-Patcher_Linux/Sharpii-Net-Core-1.1.1-"
error() {
    sc 0 "Error"
    printf "An error has occurred.\n\n* Task: $task\n* Command: $BASH_COMMAND\n* Line: $1\n* Exit code: $2\n\n" | fold -s -w $(tput cols)

    case "$task" in
        "None." ) printf "NOTE:\n\t* Unexpected error. Please contact support with the below provided information quoting the above information.\n\n" | fold -s -w $(tput cols) ;;
    esac

    printf "$helpmsg\n" | fold -s -w $(tput cols)
    exit
}

trap 'error $LINENO $?' ERR
set -o pipefail
set -o errtrace

#detect architecture to download the correct Sharpii binary
task="Detect host architecture and kernel"
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

printf "\n* Detected kernel: $kernel\n* Detected architecture: $arch\n"

deps() {
    task="Check dependencies, and automatically install if needed and able to."
    printf "Checking dependencies...\n"
    [[ -n "$(command -v pacman)" ]] && pm="pacman -S"
    [[ -n "$(command -v apt)" ]] && pm="apt install"
    [[ -n "$(command -v emerge)" ]] && pm="emerge -aqv"
    [[ -n "$(command -v zypper)" ]] && pm="zypper install"
    [[ -n "$(command -v dnf)" ]] && pm="dnf install"

    dependencies=("curl")

    for i in "${dependencies[@]}"; do
        [[ -z "$(command -v $i)" ]] && missing+="$i"
    done; unset i
    for i in "${missing[@]}"; do
        [[ -n $pm ]] && printf "\n* $i is missing! Attempting to install using detected package manager (you may be prompted for your password)...\n" | fold -s -w $(tput cols) && $sudo0 $pm $(indep $i) || ex "\n* $i is missing! Please install it using your preferred package manager.\n\n$helpmsg\n"
    done; unset i
}

download() {
    task="Download required binaries, and set executable permissions"
    printf "Downloading required binaries...\n\n"
    mkdir -p bin && cd bin
    if [[ -e sharpii ]]; then
        printf "* Sharpii appears to exist. Not downloading.\n"
    else
        printf "* Downloading Sharpii for $kernel $arch...\n"
        curl -sL "$sharpii$kernel-$arch" -o sharpii
    fi
    if [[ -e lzx ]]; then
        printf "* LZX appears to exist. Not downloading.\n"
    else
        printf "* Downloading LZX for $kernel $arch...\n"
        curl -sL $lzx$kernel-$arch -o lzx
    fi
    if [[ -e wiiwarepatcher ]]; then
        printf "* wiiwarepatcher appears to exist. Not downloading.\n"
    else
        printf "* Downloading wiiwarepatcher for $kernel $arch...\n"
        curl -sL $wiiwarepatcher$kernel-$arch -o wiiwarepatcher
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
	./bin/sharpii WAD -u "$f" "temp"
	mv ./temp/00000001.app 00000001.app
	./bin/wiiwarepatcher
	mv 00000001.app ./temp/00000001.app
	rm "$f"
	./bin/sharpii WAD -p "temp" "./wiimmfi-wads/${f}-Wiimmfi"
	rm -r temp
done
