#
# Copyright (C) 2023 The DerpFest Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/ruby/device.mk)

# Inherit some common DerpFest stuff.
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

PRODUCT_NAME := derp_ruby
PRODUCT_DEVICE := ruby
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22101316G

# Inherit some common DerpFest stuff
DERP_MAINTAINER := Pichuiscute
DERP_BUILD_TYPE := Unofficial
TARGET_BOOT_ANIMATION_RES := 1440
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
WITH_GAPPS := true
TARGET_ENABLE_BLUR := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ruby-user 12 SP1A.210812.016 V14.0.1.0.TMOMIXM release-keys"

BUILD_FINGERPRINT := Redmi/ruby_global/ruby:12/SP1A.210812.016/V14.0.1.0.TMOMIXM:user/release-keys
