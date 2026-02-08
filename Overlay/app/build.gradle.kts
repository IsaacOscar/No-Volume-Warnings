plugins {
    alias(libs.plugins.android.application) }

android {
    lint {
        checkReleaseBuilds = false }

    namespace = "IsaacOscar.NoVolumeWarnings"
    compileSdk {
        version = release(26) }
    signingConfigs {
        create("release") {
            storeFile = file("../keys.jks")
            storePassword = "123456"
            keyPassword = "123456"
            keyAlias = "key0" }}
    defaultConfig {
        applicationId = "IsaacOscar.NoVolumeWarnings"
        minSdk = 26
        targetSdk = 26
        versionCode = 1
        versionName = "1.0"
        signingConfig = signingConfigs.getByName("release")}

    buildTypes {
        release {
            isMinifyEnabled = false }}}