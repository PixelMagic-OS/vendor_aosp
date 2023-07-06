# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)
CUSTOM_DEVICE ?= $(TARGET_DEVICE)
BUILD_SIGNATURE_KEYS := release-keys
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CUSTOM_DEVICE)/$(CUSTOM_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Compress AOSP recovery, for our infra
ifeq ($(TARGET_USES_TAR_COMPRESSED_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.pixelexperience.tar_compressed_recovery=true
endif

# Custom security patch
CUSTOM_SECURITY_PATCH := 2022-08-05

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.pm.version=$(PM_BASE_VERSION) \
    org.pm.version.display=$(CUSTOM_VERSION) \
    org.pm.build_date=$(CUSTOM_BUILD_DATE) \
    org.pm.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.pm.build_type=$(CUSTOM_BUILD_TYPE) \
    org.pm.codename=$(PM_BASE_VERSION) \
    org.pm.build_version=$(PM_BUILD_VERSION) \
    ro.pm.maintainer=$(PM_MAINTAINER) \
    org.pm.device=$(TARGET_DEVICE)
