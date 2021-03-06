#!/usr/bin/env bash

echo "Copying plugins to .app"

build_dir=build

mkdir -p ${build_dir}/src/MellowPlayer.app/Contents/PlugIns/services
mkdir -p ${build_dir}/src/MellowPlayer.app/Contents/Resources

cp -R plugins/ ${build_dir}/src/MellowPlayer.app/Contents/PlugIns/services
cp scripts/packaging/osx/mellowplayer.icns ${build_dir}/src/MellowPlayer.app/Contents/Resources
cp scripts/packaging/osx/Info.plist ${build_dir}/src/MellowPlayer.app/Contents

mkdir -p  ${build_dir}/src/MellowPlayer.app/Contents/Resources/qml/QtQuick/
cp -R /usr/local/opt/qt/qml/QtQuick/Controls ${build_dir}/src/MellowPlayer.app/Contents/Resources/qml/QtQuick/

qml_dir=$PWD/lib/MellowPlayer/Presentation/Views
echo "QML Scanned Dir: ${qml_dir}"

/usr/local/opt/qt/bin/macdeployqt ${build_dir}/src/MellowPlayer.app -dmg -qmldir=$PWD/lib/MellowPlayer/Presentation/Views -verbose=3

mkdir -p dist
cp ${build_dir}/src/MellowPlayer.dmg dist/