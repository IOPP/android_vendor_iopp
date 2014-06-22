# Check for target product
ifeq (iopp_grouper,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_tvdpi

#  
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/common/bootlogo/iopp_logo_720x1280.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/iopp/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/iopp/config/iopp_common.mk

# Inherit CM device configuration
$(call inherit-product, device/asus/grouper/cm.mk)

PRODUCT_NAME := iopp_grouper

endif
