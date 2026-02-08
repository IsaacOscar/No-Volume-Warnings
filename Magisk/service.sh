resetprop -w sys.boot_completed 0 # Wait for boot to complete

# This is unecessary if the setting isn't already present (which was the case for me)
settings put secure audio_safe_csd_as_a_feature_enabled 0