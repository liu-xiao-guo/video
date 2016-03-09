TEMPLATE = aux
TARGET = video

RESOURCES += video.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true) \
             $$files(*.mp4,true) \
             $$files(*,true)

CONF_FILES +=  video.apparmor \
               video.desktop \
               video.png

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES}

#specify where the qml/js files are installed to
qml_files.path = /video
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /video
config_files.files += $${CONF_FILES}

INSTALLS+=config_files qml_files

