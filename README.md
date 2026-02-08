Based on <https://github.com/Magisk-Modules-Alt-Repo/Disable_high_volume_warning>

# Installation
Just load <NoVolumeWarning.zip> into Magisk

# Building
If you want to build it yourself:
1. Modify the `sdk.dir` variable in <Overlay/local.properties> to the location of your android sdk
2. Set the `JAVA_HOME` variable in <Overlay/local.properties> to the appropriate location (such as your Android Studio JBR)
3. Run <build.fish>


# Details
This module is based on the source code for Android 16 r4, `com.android.server.audio.SoundDoseHelper`.
However, I've set the SDK version so it can load on Android 8.0 (this was the lowest version that sucesfully built). It may not actualy work on this version though, as I only have an Android 16 device to test.

Specifically, the [`updateSafeMediaVolume_l`](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-16.0.0_r4/services/core/java/com/android/server/audio/SoundDoseHelper.java#1013) and [`updateCsdEnabled`](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-16.0.0_r4/services/core/java/com/android/server/audio/SoundDoseHelper.java#1055) functions.

Note: this will not work if the [`setCsdAsAFeatureEnabled`](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-16.0.0_r4/services/core/java/com/android/server/audio/SoundDoseHelper.java#552) is ever called (none of the code in the <android.googlesource.com> repos does so).