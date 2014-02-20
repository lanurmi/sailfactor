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
                title: qsTr("About Sailfactor")
            }

            SectionHeader {
                text: qsTr("License")
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("[to be decided]")
            }

            SectionHeader {
                text: qsTr("Author")
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
                text: qsTr("Source code")
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("will be available at github")
                BackgroundItem {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally("http://www.github.com/lanurmi/")
                }
            }
        }
    }
}
