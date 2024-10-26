#
# Copyright (C) 2019-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Inherit from sm7250-common
$(call inherit-product, device/motorola/sm7250-common/common.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk

PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# SKU specific RROs
PRODUCT_PACKAGES += \
    LineageSystemUIVariant1 \
    LineageSystemUIVariant2 \
    LineageSystemUIVariant3 \

# Audio
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.2-impl \
    libgui_vendor

# audio.primary.lito shim
PRODUCT_PACKAGES += \
    android.hardware.power-V1-ndk_platform.vendor

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Barometer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/unavail.android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_dn/unavail.android.hardware.sensor.barometer.xml \
    $(LOCAL_PATH)/configs/sensors/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_dnp/android.hardware.sensor.barometer.xml \
    $(LOCAL_PATH)/configs/sensors/unavail.android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/sku_n/unavail.android.hardware.sensor.barometer.xml \
    $(LOCAL_PATH)/configs/sensors/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_np/android.hardware.sensor.barometer.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor \
    com.motorola.hardware.biometric.fingerprint@1.0.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-egis.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-egis.idc \
    $(LOCAL_PATH)/configs/keylayout/uinput-egis.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-egis.kl

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    init.qti.fm.sh \
    qcom.fmradio

PRODUCT_BOOT_JARS += qcom.fmradio

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.kiev

# Media
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Ramdisk
PRODUCT_PACKAGES += \
    init.mmi.charge.sh \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh \
    init.qti.chg_policy.sh

PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.recovery.lkm.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/load_touch.sh:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/load_touch.sh

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VNDK
PRODUCT_PACKAGES += \
    libcomparetf2_shim

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/aoa_cldb_falcon.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_falcon.bin \
    $(LOCAL_PATH)/configs/wifi/aoa_cldb_swl14.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_swl14.bin \
    $(LOCAL_PATH)/configs/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/kiev/kiev-vendor.mk)
