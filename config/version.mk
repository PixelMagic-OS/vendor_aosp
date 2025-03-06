# Type of Build
CUSTOM_BUILD_TYPE ?= UNOFFICIAL

# PixelMagic Props
PM_BASE_VERSION = ALPHAGENE

# Time Related
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

# Platform (Android Version)
CUSTOM_PLATFORM_VERSION := 15.0
PM_BUILD_VERSION = 15.1
PM_RECOVERY_VERSION := PixelMagic-$(CUSTOM_BUILD)

CUSTOM_VERSION := PixelMagic_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)
CUSTOM_VERSION_PROP := fifteen

# PixelOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.date=$(BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.fingerprint=$(ROM_FINGERPRINT) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.modversion=$(CUSTOM_VERSION)

# Updater
PRODUCT_PRODUCT_PROPERTIES += \
    net.pm.version=$(CUSTOM_VERSION_PROP)

# Versioning props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.pm.version=$(PM_BASE_VERSION) \
    org.pm.build_date=$(CUSTOM_BUILD_DATE) \
    org.pm.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.pm.build_type=$(CUSTOM_BUILD_TYPE) \
    org.pm.codename=$(PM_BASE_VERSION) \
    org.pm.build_version=$(PM_BUILD_VERSION) \
    ro.pm.maintainer=$(PM_MAINTAINER) \
    org.pm.device=$(CUSTOM_BUILD) \
    ro.pm.recovery.version=$(PM_RECOVERY_VERSION)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/aosp/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/aosp/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/aosp/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/aosp/signing/keys/otakey.x509.pem
endif
endif
