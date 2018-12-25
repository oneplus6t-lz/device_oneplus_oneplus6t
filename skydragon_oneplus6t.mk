# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit some common SkyDragon stuff.
$(call inherit-product, vendor/skydragon/products/common.mk)

AB_OTA_UPDATER := true

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus6t/overlay

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/oneplus6t/device.mk)

ALLOW_MISSING_DEPENDENCIES := true

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Discard inherited values and use our own instead.
PRODUCT_NAME := skydragon_oneplus6t
PRODUCT_DEVICE := oneplus6t
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := ONEPLUS A6013

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus6T PRODUCT_NAME=OnePlus6T

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=OnePlus/OnePlus6T/OnePlus6T:9/PKQ1.180716.001/1811270237:user/release-keys \
    PRIVATE_BUILD_DESC="OnePlus6T-user 9 PKQ1.180716.001 1811270237 release-keys"

TARGET_VENDOR := oneplus

#PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.model
