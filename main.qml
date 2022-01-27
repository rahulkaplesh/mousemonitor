import QtQuick
import QtQuick.Controls 6.2
import QtQuick.Controls.Material 6.2

Window {
    width: 640
    height: 480
    visible: true
    id: root

    Row {
        id: tools
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 450
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0

        Button {
            id: clear
            text: qsTr("Clear")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            onClicked: {
                canvas.clear()
                mouse.clear()
            }
        }

        Button {
            id: save
            text: qsTr("Save")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            onClicked: {
                mouse.save()
            }
        }
    }

    Canvas {
        id: canvas
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tools.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.leftMargin: 0
        property int lastX: 0
        property int lastY: 0

        function clear() {
            var ctx = getContext('2d')
            ctx.reset()
            canvas.requestPaint()
        }

        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth = 2
            ctx.strokeStyle = color.red
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = area.mouseX
            lastY = area.mouseY
            ctx.lineTo(lastX, lastY)
            ctx.stroke()

            mouse.add(lastX, lastY)
        }

        MouseArea {
            id: area
            anchors.fill: parent
            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }
            onPositionChanged: {
                canvas.requestPaint()
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}D{i:2}D{i:3}D{i:1}
}
##^##*/
