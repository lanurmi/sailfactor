import Sailfish.Silica 1.0
import QtQuick 2.0

Page {
    id: aboutPage

    SilicaFlickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: col.height


        VerticalScrollDecorator {}

        Column {
            id: col
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: "About Sailfactor"
            }

            SectionHeader {
                text: "License"
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: "[to be decided]"
            }

            SectionHeader {
                text: "Author"
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: "Lauri Nurmi <lanurmi@iki.fi>"
            }

            SectionHeader {
                text: "Source code"
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: "will be available at github"
                BackgroundItem {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally("http://www.github.com/lanurmi/")
                }
            }
        }
    }
}
