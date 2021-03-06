PLATFORM_PATH := device/hardkernel/odroidgoa

# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# DRM
BOARD_USE_DRM := true
TARGET_ENABLE_MEDIADRM_64 := true

TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

# Enable 64-bits binder
TARGET_USES_64_BIT_BINDER := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# generic wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
#WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true


# BT configs
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_LINUX := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hardkernel/odroidgoa/bluetooth

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
BUILD_EMULATOR := false

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_RECOVERY_AS_BOOT := true
PRODUCT_BUILD_RECOVERY_IMAGE := true


BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := false

TARGET_USES_HWC2 		:= true
USE_OPENGL_RENDERER 		:= true
TARGET_SCREEN_DENSITY 		:= 120

# Vulkan
BOARD_INSTALL_VULKAN := true

# Camera
USE_CAMERA_STUB := false

BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1394739172 #$(shell echo $$((1300*1024*1024))) # 1.33GB
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456 # 256M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Recovery
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_FSTAB    := device/hardkernel/odroidgoa/fstab.odroidgoa
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := $(shell echo $$((200*1024*1024))) # 200M
#BOARD_CACHEIMAGE_PARTITION_SIZE := $(shell echo $$((200*1024*1024))) # 200MB
#BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_DENSITY := mdpi
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_LEFT
TARGET_RECOVERY_UI_SCREEN_WIDTH := 480


ifneq ($(TARGET_NO_RECOVERY),true)
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidgoa/init.recovery.common.rc:recovery/root/init.recovery.rk3326.rc
endif

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

OVERRIDE_RS_DRIVER := libRSDriverArm.so

DEVICE_MANIFEST_FILE := device/hardkernel/odroidgoa/manifest.xml
DEVICE_MATRIX_FILE := device/hardkernel/odroidgoa/compatibility_matrix.xml
#PRODUCT_ENFORCE_VINTF_MANIFEST :=true
VINTF_ENFORCE_NO_UNUSED_HALS := true
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# enable SVELTE malloc
MALLOC_SVELTE := true

#Config omx to support codec type.
BOARD_SUPPORT_VP9 := false
BOARD_SUPPORT_VP6 := false
DEVICE_HAVE_LIBRKVPU ?= true

# Sepolicy
BOARD_SEPOLICY_DIRS := $(DEVICE_PATH)/sepolicy

