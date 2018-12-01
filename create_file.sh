#! /bin/bash
#File: create.sh
#Author: Lars Onselius
#Description: A shell script that creates a file with correct header
#Arguments: 1 - the name of the file to create.

#check arguments
function check_arguments() {
    if [ ! "$#" -eq 1 ]; then
        echo "Needs an argument"
        exit 1
    fi
}

#check if file exits
function check_exists() {
    if [ -e "$1" ]; then
        echo "The file $1 already exists!"
        exit 1
    fi
}

#create header text depending on filetype
function add_header() {
    extension=$(echo "$1" | cut -f 2 -d '.')
    if [ "$extension" = "py" ]; then
        echo '#! /usr/bin/python3' >> $1
    else
        echo '#! /bin/bash' >> $1
    fi
    echo "#File: $1" >> $1
    echo "#Author: Lars Onselius" >> $1
    echo "#Description: " >> $1
    echo "#Arguments: " >> $1
}

#chmod file, making it executable
function make_executable() {
    chmod 755 "$1"
}

check_arguments "$@"
check_exists "$1"
add_header "$1"
make_executable "$1"
vim "$1"
