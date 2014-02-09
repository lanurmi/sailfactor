import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    initialPage: sailFactorComponent
    cover: Qt.resolvedUrl("cover/Cover.qml")
    Component {
        id: sailFactorComponent
        SailFactor { }
    }
}


