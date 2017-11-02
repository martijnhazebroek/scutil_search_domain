#/bin/bash

scutil_helper_dir=~/.scutil/
scutil_helper_file=helpers
scutil_full_path=$scutil_helper_dir$scutil_helper_file
verbose=1

is_installed() {
    if [ -f $scutil_full_path ]; then return 0; else return 1; fi
}

install() {
    create_target_dir
    download_file
    install_to_possible_shells
}

create_target_dir() {
    if [ ! -d $scutil_helper_dir ]; then
        dlog "Creating directory: $scutil_helper_dir"
        mkdir -p $scutil_helper_dir;
    else
        dlog "$scutil_helper_dir already exists"
    fi
}

download_file() {
    file_to_download=https://raw.githubusercontent.com/martijnhazebroek/scutil_search_domain/master/scutil_helpers.sh
    dlog "Download file: $file_to_download to: $scutil_full_path"
    curl -fsSL -o $scutil_full_path $file_to_download
}

install_to_possible_shells() {
    target=~/.bashrc
    if [ -f $target ]; then install_to_shell $scutil_full_path "$target"; else dlog "warning: $target file not found"; fi
    target=~/.zshrc
    if [ -f $target ]; then install_to_shell $scutil_full_path "$target"; else dlog "warning: $target file not found"; fi
}

install_to_shell() {
    source=$1
    target=$2
    dlog "Adding scutil helper functions to $target"
    printf "\n\n" >> $target
    printf ". $scutil_full_path"  >> $target
}

install_and_run() {
    if ! is_installed; then install; fi
    search_domain=$1
    . $scutil_full_path
    install_search_domain $search_domain
}

dlog() {
    if [ $verbose -eq 0 ]; then echo $1; fi
}

if [[ $# -lt 1 ]]; then
    echo "usage: configure_search_domain your.domain.tld [-v]"
else
    if [ "$2" == "-v" ]; then verbose=0; else verbose=1; fi
    install_and_run $*
fi


