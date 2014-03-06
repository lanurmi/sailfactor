import QtQuick 2.0
import Sailfish.Silica 1.0
import "../pages"

CoverBackground {

    Label {
        id: label
        anchors.centerIn: parent
        width: parent.width
        height: parent.height

        text: getOutput()
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
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
