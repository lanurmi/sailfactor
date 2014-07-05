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
        if (factorizationCompleted() === false)
            _sailfactor._slider ++;
    }

    function prevStep() {
        if (_sailfactor._slider > 0)
            _sailfactor._slider --;
    }

    function factorizationCompleted() {
        // Return true, if
        // 0. the digit '1' is entered in the field -- it is not a prime but cannot be factorized further
        // 1. the results ends in a '</b>', i.e. the last number is a prime.
        // 2. the last number is a prime but is followed by an exponent of either 1 or 2 digits

        if (parseInt(_sailfactor._field) === 1)
            return true;

        // This is ugly but avoids potentially calculcating things twice.
        for (var i = 1; i <= 3; ++i) {
            if (_sailfactor._factorizationResult.charAt(_sailfactor._factorizationResult.length - i) == '>')
                return true;
        }

        return false;
    }
}


