#
# Copyright (C) 2023 The Alphadroid Project
# Copyright (C) 2023 The EvolutionOS Project
# Copyright (C) 2023 The PixelOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_ruby.mk \
    $(LOCAL_DIR)/evolution_ruby.mk \
    $(LOCAL_DIR)/aosp_ruby.mk

COMMON_LUNCH_CHOICES := \
    lineage_ruby-user \
    lineage_ruby-userdebug \
    lineage_ruby-eng \
    evolution_ruby-user \
    evolution_ruby-userdebug \
    evolution_ruby-eng \
    aosp_ruby-user \
    aosp_ruby-userdebug \
    aosp_ruby-eng
