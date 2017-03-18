# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/common

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/bin/sysinit:system/bin/sysinit

# init file
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/etc/init.custom.rc:root/init.custom.rc

# Camera Effects
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/aosp/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Bootanimation
PRODUCT_COPY_FILES += vendor/aosp/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# World APN list
PRODUCT_COPY_FILES += vendor/aosp/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

# Version
CUSTOM_VERSION := $(PLATFORM_VERSION)-$(shell date +%Y%m%d)-mod

$(call inherit-product-if-exists, vendor/aosp/prebuilt/prebuilt.mk)
$(call inherit-product-if-exists, vendor/aosp/sepolicy/sepolicy.mk)
