# Check for target product
ifeq (iopp_hlte,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

#  
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/common/bootlogo/pac_logo_1080x1920.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/iopp/config/iopp_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/hlte/cm.mk)

PRODUCT_NAME := iopp_hlte

endif
