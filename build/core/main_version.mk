# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# PixelOS Platform Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.custom.build.date=$(BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.fingerprint=$(ROM_FINGERPRINT) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.modversion=$(CUSTOM_VERSION)

# Updater
ifeq ($(IS_OFFICIAL),true)
    ADDITIONAL_SYSTEM_PROPERTIES  += \
        net.pixelos.build_type=ci \
        net.pixelos.version=$(CUSTOM_VERSION_PROP)
endif

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.pm.version=$(PM_BASE_VERSION) \
    org.pm.build_date=$(CUSTOM_BUILD_DATE) \
    org.pm.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.pm.build_type=$(CUSTOM_BUILD_TYPE) \
    org.pm.codename=$(PM_BASE_VERSION) \
    org.pm.build_version=$(PM_BUILD_VERSION) \
    ro.pm.maintainer=$(PM_MAINTAINER) \
    org.pm.device=$(TARGET_DEVICE)