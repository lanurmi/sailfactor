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
        return fact.factorize(parseInt(_sailfactor._aText), _sailfactor._slider, true);
    }

    function nextStep() {
        if (_sailfactor._slider < 22) // FIXME: should read the real max from somewhere
            _sailfactor._slider ++;
    }

    function prevStep() {
        if (_sailfactor._slider > 0)
            _sailfactor._slider --;
    }
}


