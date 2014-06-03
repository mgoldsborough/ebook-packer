#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Invalid parameters."
    exit 1
fi

main() {

    local filename=$1
    echo "Deleting $filename"

    rm -f $filename

    echo 'Zipping mimetype'
    zip -0 -X $filename mimetype

    echo 'Zipping epub content'
    zip -9 -r $filename META-INF/ OEBPS/
}
main $1
