LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libGLES_mali.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/egl/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/egl/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/egl/
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/egl/
LOCAL_MULTILIB := both
LOCAL_SHARED_LIBRARIES := android.hardware.graphics.common@1.0 libz libnativewindow libc++ liblog libm libc libdl
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libbccArm.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
LOCAL_MULTILIB := 64
# Bypass prebuilt ELF check because libLLVM is not a module (it is copied by
# PRODUCT_COPY_FILES instead).
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libRSDriverArm.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
LOCAL_MULTILIB := both
LOCAL_SHARED_LIBRARIES := libRS_internal libRSCpuRef liblog libnativewindow libbcinfo libdl libc++ libc libm
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libmalicore.bc
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
LOCAL_MULTILIB := both
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vulkan.rk3326.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/hw/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/hw/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/hw
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/hw
LOCAL_MULTILIB := both
LOCAL_SHARED_LIBRARIES := android.hardware.graphics.common@1.0 libz libnativewindow libc++ liblog libm libc libdl
# Bypass prebuilt ELF check because the DT_SONAME "libGLES_mali.so" is
# different from LOCAL_MODULE "vulkan.hikey960.so".
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

