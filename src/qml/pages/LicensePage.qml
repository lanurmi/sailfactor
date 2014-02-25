import Sailfish.Silica 1.0
import QtQuick 2.0

Page {
    id: licensePage
    width: textArea.width

    SilicaFlickable {
        id: textArea
        anchors.fill: parent
        contentWidth: licText.width
        contentHeight: theColumn.height

        Column {
            id: theColumn
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                id: header
                title: qsTr("License for Sailfactor")
            }

            Label {
                id: licText
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: "\
The MIT License (MIT)\n\
\n\
Copyright © 2014 Lauri Nurmi\n\
\n\
Permission is hereby granted, free of charge, to any person obtaining a copy \
of this software and associated documentation files (the \u201CSoftware\u201D), to deal \
in the Software without restriction, including without limitation the rights \
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell \
copies of the Software, and to permit persons to whom the Software is \
furnished to do so, subject to the following conditions:\n\
\n\
The above copyright notice and this permission notice shall be included in all \
copies or substantial portions of the Software.\n\
\n\
THE SOFTWARE IS PROVIDED \u201CAS IS\u201D, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR \
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, \
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE \
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER \
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, \
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE \
SOFTWARE."
                wrapMode: Text.WordWrap
            }
        }
        VerticalScrollDecorator { flickable: textArea }
    }
}
