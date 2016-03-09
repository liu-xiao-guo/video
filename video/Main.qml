import QtQuick 2.0
import Ubuntu.Components 1.1
import QtMultimedia 5.0

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "video.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("Video")

        Video {
            id: video
            anchors.fill: parent
            source: "sample.mp4"

            focus: true

            Keys.onSpacePressed: {
                video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
            }

            Keys.onLeftPressed: video.seek(video.position - 5000)
            Keys.onRightPressed: video.seek(video.position + 5000)
        }

        Button {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: units.gu(1)
            text: "Play"

            onClicked: {
                video.play()
            }
        }

        Image {
            id:left
            width: units.gu(4)
            height: width
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: units.gu(1)
            anchors.bottomMargin: units.gu(1)
            source: "icon-left-arrow.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    video.seek(video.position - 1000);
                }
            }
        }

        Image {
            id:right
            width: units.gu(4)
            height: width
            mirror: true
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: units.gu(1)
            anchors.bottomMargin: units.gu(1)
            source: "icon-left-arrow.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    video.seek(video.position + 1000);
                }
            }
        }
    }
}

