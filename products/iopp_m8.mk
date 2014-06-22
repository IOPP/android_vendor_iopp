# Check for target product
ifeq (iopp_m8,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

# Add bluefa1con bootanim
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/iopp/config/iopp_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/m8/cm.mk)

PRODUCT_NAME := iopp_m8

endif
