import QtQuick 2.0
import Sailfish.Silica 1.0


// Just a simple example to demo both property binding and doing something via pulley menu action
// to provide a sample of Sailfish-specific UI testing
Page {
    id: page

    // Exposing properties for testing. In real app you might like to hide it behind a single interface
    // e.g. via "property variant internals" and then put a QtObject with the individual properties to it
    // @TODO: implement exposing via single internals property
 /*   property alias _aText: a.text
    property alias _sumText: sumLabel.text
    property alias _substrText: substrLabel.text
    property alias _subtractMenuAction: subtractMenuAction
*/
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
/*        PullDownMenu {
            id: pullDownMenu
            MenuItem {
                id: subtractMenuAction
                text: "Subtract!"
                onClicked: {
                    console.log("subtractMenuAction clicked")
                    substrLabel.text = "A-B = " + (parseInt(a.text) - parseInt(b.text))
                }

            }
        }*/
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Factorization"
            }

            BackgroundItem {
                width: parent.width
                height: contentItem.childrenRect.height
                Component.onCompleted: {
                    console.log("row compl. wxh: " + width + "x" + height)
                }

/*                Row {
                    anchors.left: parent.left
                    anchors.right: parent.horizontalCenter
                    height: aLabel.height

                    Label {
                        id: aLabel
                        text: "Integer into prime factors"
                    }
                } */
                Row {
                    anchors.left: parent.horizontalCenter
                    anchors.right: parent.left
                    height: a.height

                    TextField {
                        id: a
                        //height: aLabel.height
                        text: "14"
                        validator: IntValidator {}
                        // Show a numpad only, instead of a full keyboard
                        inputMethodHints: Qt.ImhDigitsOnly
                    }
                }
            }
            Slider {
                anchors.left: parent.left
                anchors.right: parent.right
                id: iterSlider
                minimumValue: 1
                maximumValue: 20
                value: 1
                stepSize: 1
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Theme.paddingLarge

                id: slideLabel
                text: fact.factorize(parseInt(a.text), iterSlider.value)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }
        }
    }

}


