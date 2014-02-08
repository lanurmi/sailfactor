#!/bin/bash

# Script for running tests. That's for specifying just one argument in QtCreator's configuration
/usr/bin/tst-harbour-sailfactor -input /usr/share/tst-harbour-sailfactor

# When you'll get some QML components in the main app, you'll need to import them to the test run
# /usr/bin/tst-harbour-sailfactor -input /usr/share/tst-harbour-sailfactor -import /usr/share/harbour-sailfactor/qml/components