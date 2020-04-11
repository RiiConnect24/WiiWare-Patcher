#! /bin/bash

sharpii="https://nxnt.link/sharpii1-1-1-${sys,,}" # end link manually updated on my end - twosecslater

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
    sys=$arch
else
    kernel="$(uname -s)" # darwin
    arch="amd64" # will update this when ARM MacBooks come around. (written April 2020)
    sys=$kernel
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

    dependencies=("curl" "unzip")

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
        curl -sL "$sharpii" -o sharpii
    fi
    [[ ! -x sharpii ]] && chmod +x sharpii || true
    cd ..
}

deps
download
