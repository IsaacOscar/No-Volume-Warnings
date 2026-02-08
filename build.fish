#!/usr/bin/fish

set APK Overlay/app/build/outputs/apk/release/app-release.apk
set DEST Magisk/system/vendor/overlay/NoVolumeWarnings.apk

set_color -o blue
echo Compilling Overlay apk

cd Overlay

set JAVA_HOME 'C:\Program Files\Android\Android Studio\jbr'
if test -e /proc/sys/fs/binfmt_misc/WSLInterop # WSL, build on Windows
	cmd.exe /C "set JAVA_HOME=$JAVA_HOME&& gradlew.bat assembleRelease" || exit $status
else
	./gradle assembleRelease || exit $status
end
cd ..

cp Overlay/app/build/outputs/apk/release/app-release.apk Magisk/system/vendor/overlay/NoVolumeWarnings.apk || exit $status

cd Magisk
rm -rf ../NoVolumeWarning.zip 2>/dev/null
zip -r ../NoVolumeWarning.zip * || exit $status


#   ├── post-fs-data.sh     <--- This script will be executed in post-fs-data
#   ├── service.sh          <--- This script will be executed in late_start service
#|   ├── uninstall.sh        <--- This script will be executed when Magisk removes your module
