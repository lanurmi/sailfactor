#!/bin/bash
# This script should be run on the MerSDK virtual machine.

/srv/mer/targets/SailfishOS-i486-x86/usr/lib/qt5/bin/lupdate src/qml/{,cover,pages}/*.qml -verbose -ts lang/sailfactor_$1.ts 
/srv/mer/targets/SailfishOS-i486-x86/usr/lib/qt5/bin/lrelease lang/sailfactor_$1.ts 
