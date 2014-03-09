import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property alias _aText: factorizationResult.text
    property alias _slider: levelSlider.value
    property alias _field: inputField.text

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        PullDownMenu {
            id: pullDownMenu
            MenuItem {
                id: aboutMenuAction
                text: qsTr("About")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }
            MenuItem {
                id: helpMenuAction
                text: qsTr("Help")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("HelpPage.qml"))
                }
            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Factorization")
            }

            BackgroundItem {
                width: parent.width
                height: contentItem.childrenRect.height
                Row {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: inputField.height
                    width: inputField.width

                    TextField {
                        id: inputField
                        width: parent.width
                        text: ""
                        placeholderText: qsTr("Enter an integer.")
                        // Ten million ought to be enough for anyone.
                        validator: IntValidator { bottom: -9999999; top: 9999999 }
                        // Show a numpad only, instead of a full keyboard
                        inputMethodHints: Qt.ImhDigitsOnly
                        focus: true
                    }
                }
            }
            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Theme.paddingLarge
                height: 100

                id: factorizationResult
                text: fact.factorize(parseInt(inputField.text), levelSlider.value, false)
                wrapMode: Text.WordWrap
            }
            Slider {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Theme.paddingLarge

                id: levelSlider
                minimumValue: 0
                maximumValue: 22
                value: 1
                stepSize: 1
                label: qsTr("Steps")
                valueText: value
            }
        }
    }
}


