# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Device was launched with M
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/hardkernel/odroidgoa/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_mini_tablet_wifionly.mk)

# Vendor security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

PRODUCT_NAME := lineage_odroidgoa
PRODUCT_DEVICE := odroidgoa
PRODUCT_MANUFACTURER := HardKernel Co., Ltd.
PRODUCT_BRAND := ODROID
PRODUCT_MODEL := LineageOS for Odroid Go2
TARGET_BOARD_PLATFORM := rk3326
TARGET_BOARD_PLATFORM_GPU := mali-tDVx
TARGET_BOARD_HARDWARE := odroidgoa

TARGET_VENDOR := rockchip

PRODUCT_GMS_CLIENTID_BASE := android-rockchip

