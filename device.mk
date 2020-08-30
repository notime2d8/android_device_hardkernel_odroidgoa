# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi ldpi
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

# Specify OpenGLES version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/hardkernel/odroidgoa/overlay \
    device/hardkernel/odroidgoa/overlay-lineage

# Soong namespaces
PRODUCT_SOONG_NAMESPACES := device/hardkernel/odroidgoa 

# Art
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	dalvik.vm.boot-dex2oat-threads=2
	dalvik.vm.dex2oat-threads=2
	dalvik.vm.image-dex2oat-threads=2

# 4 apps in the background
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.max_starting_bg=4 

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=256m

# Reduces GC frequency of foreground apps by 50%
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.foreground-heap-growth-multiplier=2.0


PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/fstab.odroidgoa:$(TARGET_COPY_OUT_RAMDISK)/fstab.odroidgoa \
    	$(LOCAL_PATH)/fstab.odroidgoa:$(TARGET_COPY_OUT_ROOT)/fstab.odroidgoa \
    	$(LOCAL_PATH)/fstab.odroidgoa:$(TARGET_COPY_OUT_VENDOR)/fstab.odroidgoa 
    	
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/init.odroidgoa.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroidgoa.rc \
    	$(LOCAL_PATH)/init.odroidgoa.rc:$(TARGET_COPY_OUT_ROOT)/init.odroidgoa.rc


PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/wifi/esp8089.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wlan.ko 

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/odroidgo2_joypad.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/odroidgo2_joypad.kl \
    	$(LOCAL_PATH)/ueventd.odroidgoa.rc:$(TARGET_COPY_OUT_ROOT)/ueventd.odroidgoa.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    	frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
        frameworks/native/data/etc/android.software.cts.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.cts.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    	frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.autofill.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.autofill.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.gamepad.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.gamepad.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
        frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    	frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml 

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/bluetooth/bd_addr.txt:$(TARGET_COPY_OUT_VENDOR)/etc/bt/bd_addr.txt \
    	$(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

# Copy media codecs config file
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    	$(LOCAL_PATH)/configs/media/media_codecs_google_video_rk3326.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_rk3326.xml \
    	$(LOCAL_PATH)/configs/media/98netflix:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/98netflix \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Need AppWidget permission to prevent Launcher[2|3] crashing
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml


# audio policy configuration
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml 

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Audio HIDL
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.soundtrigger@2.2-impl 

# Build default bluetooth a2dp and usb audio HALs
PRODUCT_PACKAGES += \
    audio.primary.$(TARGET_BOARD_PLATFORM) \
    audio.usb.default \
    audio.r_submix.default \
    audio.hearing_aid.default \
    libaudioroute \
    libaudio-resampler \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo
    
# Enable AAudio MMAP/NOIRQ data path.
# 1 is AAUDIO_POLICY_NEVER  means only use Legacy path.
# 2 is AAUDIO_POLICY_AUTO   means try MMAP then fallback to Legacy path.
# 3 is AAUDIO_POLICY_ALWAYS means only use MMAP path.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
# 1 is AAUDIO_POLICY_NEVER  means only use SHARED mode
# 2 is AAUDIO_POLICY_AUTO   means try EXCLUSIVE then fallback to SHARED mode.
# 3 is AAUDIO_POLICY_ALWAYS means only use EXCLUSIVE mode.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2
    

# Bluetooth HIDL
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth.a2dp@1.0-impl \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service.btlinux

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml 

PRODUCT_PACKAGES += \
	rtl8821a_fw.bin \
	rtl8821a_config.bin \
	rtl8761b_fw.bin \
	rtl8761b_config.bin

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc 

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml 

USE_CAMERA_V4L2_HAL := true
PRODUCT_PACKAGES += camera.v4l2
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.camera=v4l2

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.5-impl \
    android.hardware.camera.provider@2.5-external-service \
    camera.device@3.5-external-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

# Graphics HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.mapper@2.0-service \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.cpuvulkan.version=4198400 \
	ro.hardware.hwcomposer=$(TARGET_BOARD_HARDWARE) \
	ro.hardware.gralloc=$(TARGET_BOARD_HARDWARE)
	
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml

PRODUCT_PACKAGES += \
	libGLES_android \
	gralloc.$(TARGET_BOARD_HARDWARE) \
	hwcomposer.$(TARGET_BOARD_HARDWARE) 


#binary blobs from ARM
PRODUCT_PACKAGES +=	libGLES_mali.so \
			vulkan.rk3326.so \
			libbccArm.so \
			libRSDriverArm.so \
			libmalicore.bc 

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/mali/bifrost/lib/libclcore.bc:vendor/lib/libclcore.bc \
        $(LOCAL_PATH)/mali/bifrost/lib/libclcore_neon.bc:vendor/lib/libclcore_neon.bc \
        $(LOCAL_PATH)/mali/bifrost/bin/bcc:vendor/bin/bcc \
        $(LOCAL_PATH)/mali/bifrost/lib64/libclcore.bc:vendor/lib64/libclcore.bc \
        $(LOCAL_PATH)/mali/bifrost/lib64/libLLVM.so:vendor/lib64/libLLVM.so			

OVERRIDE_RS_DRIVER := libRSDriverArm.so

# Software Gatekeeper HAL
PRODUCT_PACKAGES += \
	gatekeeper.odroidgoa \
	android.hardware.gatekeeper@1.0-service \
	android.hardware.gatekeeper@1.0-impl

# Memtrack HAL
PRODUCT_PACKAGES += \
	memtrack.default \
	android.hardware.memtrack@1.0-impl \
	android.hardware.memtrack@1.0-service

# ThermalHAL
PRODUCT_PACKAGES += \
	thermal.default \
	android.hardware.thermal@1.0-impl \
	android.hardware.thermal@1.0-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.1-impl \
    android.hardware.drm@1.1-service \
    android.hardware.drm@1.2-service.clearkey \
    android.hardware.drm@1.2-service.widevine

# Dumpstate HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0-impl \
    android.hardware.dumpstate@1.0-service

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Light HIDL
PRODUCT_PACKAGES += \
    lights.$(TARGET_BOARD_PLATFORM)\
    android.hardware.light@2.0-service \
    android.hardware.light@2.0-impl

# Media HIDL
#    android.hardware.media.c2@1.0-service \ enable with ion
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service

# PowerHAL
PRODUCT_PACKAGES += \
    power.default \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service

# RenderScript HIDL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.0-impl \
	android.hardware.health@2.0-service

# USB HIDL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service

# Wi-Fi   
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0-service \
    android.hardware.wifi.supplicant@1.2-service 
    
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd.conf \
    hostapd \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf
    
PRODUCT_PROPERTY_OVERRIDES += wifi.supplicant_scan_interval=15
# Wi-Fi interface name
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	ro.boot.wificountrycode=US \
	wifi.direct.interface=p2p0             
                              
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant.conf
    
# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_PRODUCT_PROPERTIES += \
	ro.statsd.enable=false

PRODUCT_PACKAGES += \
	TVbro \
	TVLauncher \
	WifiDisplay \
	TrebuchetGo \
	LeanbackIME 

PRODUCT_DEXPREOPT_SPEED_APPS += \
	Settings \
	TrebuchetGo \
	SystemUI

# Exclude AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Netutils
PRODUCT_PACKAGES += \
	android.system.net.netd@1.0 \
	libandroid_net \
	netutils-wrapper-1.0

# Trust
PRODUCT_PACKAGES += \
	vendor.lineage.trust@1.0-service

# WiFi Display
PRODUCT_PACKAGES += \
	libaacwrapper \
	libnl

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
	ro.surface_flinger.primary_display_orientation=ORIENTATION_270

# All VNDK libraries (HAL interfaces, VNDK, VNDK-SP, LL-NDK)
PRODUCT_PACKAGES += vndk_package

PRODUCT_PROPERTY_OVERRIDES += \
	ro.logd.auditd=false \
	ro.logd.kernel=0

#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.logd.size=1M \
#	logd.logpersistd=logcatd \
#	logd.logpersistd.size=30 \

#        debug.hwui.use_partial_updates=false \
#    debug.hwui.use_buffer_age=false \
#	debug.sf.enable_gl_backpressure=1 \
# 	debug.hwui.renderer=skiagl \
#	debug.sf.latch_unsignaled=1 \
#	 debug.sf.disable_backpressure=1 \

PRODUCT_PROPERTY_OVERRIDES += \
debug.hwui.use_partial_updates=false \
	vendor.hwc.compose_policy=6 \
	vendor.hwc.device.primary=DSI \
        debug.stagefright.ccodec=0

# librkskia
PRODUCT_PACKAGES += \
   librkskia

# omx
PRODUCT_PACKAGES += \
    libomxvpu_enc \
    libomxvpu_dec \
    libRkOMX_Resourcemanager \
    libOMX_Core \

# Camera omx-plugin vpu akmd libion_rockchip_ext
PRODUCT_PACKAGES += \
    libvpu \
    libstagefrighthw \
    libgralloc_priv_omx \
    akmd \
    libion_ext

# For EGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.egl=mali    
    
PRODUCT_PROPERTY_OVERRIDES += \
	config.disable_rtt=true \
	config.disable_bluetooth=false \
	config.disable_vrmanager=true \
	config.disable_consumerir=true \
	config.disable_cameraservice=true 

PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes \
	ro.lockscreen.disable.default=true \
	persist.adb.tcp.port=5037 \
	persist.sys.zram_enabled=1 \
	persist.sys.purgeable_assets=1 \
	ro.kernel.android.checkjni=0 \
	debug.sf.nobootanimation=1
	
# Disable stats logging & monitoring
PRODUCT_PROPERTY_OVERRIDES += \
	debug.atrace.tags.enableflags=0 \
	debugtool.anrhistory=0 \
	ro.com.google.locationfeatures=0 \
	ro.com.google.networklocation=0 \
	profiler.debugmonitor=false \
	profiler.launch=false \
	profiler.hung.dumpdobugreport=false \
	persist.service.pcsync.enable=0 \
	persist.service.lgospd.enable=0 

### WFD
# Property to enable user to access Google WFD settings.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1
    
# Property to choose between virtual/external wfd display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wfd.virtual=0

    # HDCP
PRODUCT_PROPERTY_OVERRIDES += \
wlan.wfd.hdcp=disable \
persist.sys.wfd.nohdcp=1

# Disable Scudo outside of eng builds to save RAM.
PRODUCT_DISABLE_SCUDO := true
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# set threshold to filter unused apps
PRODUCT_PROPERTY_OVERRIDES += \
pm.dexopt.downgrade_after_inactive_days=10

#PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \

ifeq ($(PRODUCT_HAVE_RKVPU), true)
$(call inherit-product-if-exists, vendor/rockchip/common/vpu/vpu.mk)
endif

$(call inherit-product-if-exists, prebuilts/prebuiltapks/microg.mk)

