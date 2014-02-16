import Sailfish.Silica 1.0
import QtQuick 2.0

Page {
    id: aboutPage

    Column {
        width: parent.width
        spacing: Theme.paddingLarge

        PageHeader {
            title: "Sailfactor Help"
        }

        Label {
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
            text: "Sailfactor is a tool for finding the factors of an " +
            "integer, step by step. The slider is used to adjust the maximum " +
            "number of factorization steps to carry out.<br><br>" +
            "<i>Prime</i> factors are always <b>highlighted</b> in the output. " +
            "Ultimately all the factors shown will be prime factors."
            wrapMode: Text.WordWrap
        }
    }
}
