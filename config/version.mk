# Type of Build
CUSTOM_BUILD_TYPE ?= OFFICIAL

# PixelMagic Props
PM_BASE_VERSION = ALPHAGENE

# Time Related
CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

# Platform (Android Version)
CUSTOM_PLATFORM_VERSION := 15.0
PM_BUILD_VERSION = 15.0
PM_RECOVERY_VERSION := PixelMagic-$(CUSTOM_BUILD)

CUSTOM_VERSION := PixelMagic_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
CUSTOM_VERSION_PROP := fifteen

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.custom.build.date=$(BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.fingerprint=$(ROM_FINGERPRINT) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.modversion=$(CUSTOM_VERSION)

# Versioning props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.pm.version=$(PM_BASE_VERSION) \
    org.pm.build_date=$(CUSTOM_BUILD_DATE) \
    org.pm.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.pm.build_type=$(CUSTOM_BUILD_TYPE) \
    org.pm.codename=$(PM_BASE_VERSION) \
    org.pm.build_version=$(PM_BUILD_VERSION) \
    ro.pm.maintainer=$(PM_MAINTAINER) \
    org.pm.device=$(TARGET_DEVICE_NAME) \
    ro.pm.recovery.version=$(PM_RECOVERY_VERSION)

# Signing
-include vendor/lineage-priv/keys/keys.mk
