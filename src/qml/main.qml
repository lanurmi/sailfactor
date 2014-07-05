import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    id: appw
    initialPage: sailFactorComponent
    cover: Qt.resolvedUrl("cover/Cover.qml")
    Component {
        id: sailFactorComponent
        SailFactor {
            id: sailfactor
            Component.onCompleted: appw._sailfactor = sailfactor
        }
    }

    property SailFactor _sailfactor

    function getOutput() {
        if (_sailfactor._field.length === 0)
            return "<font color=\"yellow\">" + qsTr("No integer entered yet.") + "</font>";
        else
            return fact.factorize(parseInt(_sailfactor._field), _sailfactor._slider, true);
    }

    function nextStep() {
        if (_sailfactor._slider < 22) // FIXME: should read the real max from somewhere
            _sailfactor._slider ++;
    }

    function prevStep() {
        if (_sailfactor._slider > 0)
            _sailfactor._slider --;
    }

    function factorizationCompleted() {
        // This is ugly but avoids potentially calculcating things twice.

        // Return true, if
        // 1. the results ends in a '</b>', i.e. the last number is a prime.
        // 2. the last number is a prime but is followed by an exponent of either 1 or 2 digits

        for (var i = 1; i <= 3; ++i) {
            if (_sailfactor._factorizationResult.charAt(_sailfactor._factorizationResult.length - i) == '>')
                return true;
        }

        return false;
    }
}


