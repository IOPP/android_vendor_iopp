# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Themos.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Cesium.ogg

# Copy specific ROM files
#PRODUCT_COPY_FILES += \
#    vendor/iopp/prebuilt/common/apk/QuickBoot.apk:system/app/QuickBoot.apk

#Copy Theme Apks
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/common/apk/Smoke.apk:system/app/Smoke.apk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh \
    vendor/iopp/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/iopp/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh

# Screen recorder
PRODUCT_PACKAGES += \
    libscreenrecorder \
    ScreenRecorder

# init.d support
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/iopp/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/iopp/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/iopp/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check \
    vendor/iopp/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/iopp/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/iopp/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/iopp/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/iopp/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/iopp/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/iopp/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/iopp/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/iopp/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/iopp/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/iopp/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/iopp/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/iopp/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/iopp/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/iopp/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/iopp/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/iopp/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/iopp/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/iopp/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/iopp/prebuilt/common/etc/init.d/24speedy_modified:system/etc/init.d/24speedy_modified \
    vendor/iopp/prebuilt/common/etc/init.d/25loopy_smoothness_tweak:system/etc/init.d/25loopy_smoothness_tweak \
    vendor/iopp/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/iopp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/iopp/prebuilt/common/xbin/zipalign:system/xbin/zipalign

# OmniRom Packages
PRODUCT_PACKAGES += \
    OmniSwitch \

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/iopp/overlay/iopp/common

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
#    vendor/iopp/CHANGELOG.mkdn:system/etc/iopp-CHANGELOG.txt \
    vendor/iopp/CONTRIBUTORS.mkdn:system/etc/iopp-CONTRIBUTORS.txt

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/iopp/overlay/aokp/common

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

# ParanoidAndroid Proprietary
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/iopp/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

BOARD := $(subst iopp_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

# iopp version
iopp_VERSION_MAJOR = v1.00
iopp_VERSION := $(iopp_VERSION_MAJOR)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.iopp.version=$(iopp_VERSION) \
    ro.infamous.version=$(BOARD)_$(iopp_VERSION)_$(shell date +%Y%m%d-%H%M%S) \



