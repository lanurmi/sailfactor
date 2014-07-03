#!/bin/bash
# This script should be run on the MerSDK virtual machine.

if [ "$1" == "" ]; then
    echo "Usage: $0 <2-letter-langcode>"
    exit 1
fi

/srv/mer/targets/SailfishOS-i486/usr/lib/qt5/bin/lupdate src/qml/{,cover,pages}/*.qml -verbose -ts lang/sailfactor_$1.ts 
/srv/mer/targets/SailfishOS-i486/usr/lib/qt5/bin/lrelease lang/sailfactor_$1.ts 
