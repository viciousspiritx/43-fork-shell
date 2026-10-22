
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

Repeater {
    id: tray

    property var barRoot: null

    model: SystemTray.items
    
    Component.onCompleted: {
    console.log("TRAY ITEMS:",
        SystemTray.items.values.map(item => item.id).join(", "))
}

Connections {
    target: SystemTray.items

    function onObjectInsertedPost(item, index) {
        console.log("TRAY ADDED:", item.id)
    }

    function onObjectRemovedPost(item, index) {
        console.log("TRAY REMOVED:", item.id)
    }
}

    onItemAdded: (index, item) => {
    console.log("TRAY ITEM:", index, item.modelData.id,
                item.modelData.title)
}
    delegate: Item {
        id: entry

        required property SystemTrayItem modelData

        Layout.preferredWidth: 16
        Layout.preferredHeight: 16

        implicitWidth: 16
        implicitHeight: 16

        Image {
            anchors.fill: parent
            source: entry.modelData.icon
            fillMode: Image.PreserveAspectFit
            smooth: true
            sourceSize.width: 16
            sourceSize.height: 16
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
                | Qt.MiddleButton
                | Qt.RightButton

            cursorShape: Qt.PointingHandCursor

            function openMenu() {
                const item = entry.modelData;

                if (!item.hasMenu || !tray.barRoot)
                    return;

                // Współrzędne ikony względem okna panelu.
                const pos = entry.mapToItem(
                    null, 0, entry.height
                );

                item.display(
                    tray.barRoot,
                    Math.round(pos.x),
                    Math.round(pos.y)
                );
            }

            onClicked: mouse => {
                const item = entry.modelData;
                console.warn("TRAY CLICK:", item.id, item.hasMenu, item.onlyMenu);
                console.log("TRAY:", item.id,
            "hasMenu:", item.hasMenu,
            "menu:", item.menu,
            "onlyMenu:", item.onlyMenu);

                if (mouse.button === Qt.LeftButton) {
    openMenu();
                } else if (mouse.button === Qt.MiddleButton) {
                    item.secondaryActivate();
                } else if (mouse.button === Qt.RightButton) {
                    openMenu();
                }
            }

            onWheel: wheel => {
                entry.modelData.scroll(
                    wheel.angleDelta.y,
                    false
                );
            }
        }
    }
}

