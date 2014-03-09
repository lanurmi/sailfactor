import QtQuick 2.0
import Sailfish.Silica 1.0
import "../pages"

CoverBackground {

    Column {
        anchors.fill: parent
        width: 180
        spacing: Theme.paddingSmall
        y: Theme.paddingLarge
        x: Theme.paddingLarge

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Sailfactor"
            font.pixelSize: 24
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Steps: %1").arg(_sailfactor._slider)
            font.pixelSize: 18
        }

        Label {
            id: label
            x: Theme.paddingLarge
            width: parent.width

            text: getOutput()
            wrapMode: Text.WordWrap
        }
    }
    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: {
                prevStep();
            }
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: {
                nextStep();
            }
        }

    }
}
