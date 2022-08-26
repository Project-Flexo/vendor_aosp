# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)
CUSTOM_DEVICE ?= $(TARGET_DEVICE)
ifneq ($(filter OFFICIAL,$(CUSTOM_BUILD_TYPE)),)
BUILD_SIGNATURE_KEYS := release-keys
else
BUILD_SIGNATURE_KEYS := test-keys
endif
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CUSTOM_DEVICE)/$(CUSTOM_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Version
ALTHO_PLATFORM_RELEASE_OR_CODENAME := 12L

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.flexo.version=$(FLEXO_BASE_VERSION) \
    org.altho.version.display=$(FLEXO_VERSION) \
    org.altho.build_date=$(CUSTOM_BUILD_DATE) \
    org.altho.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.altho.build_type=$(CUSTOM_BUILD_TYPE) \
    org.altho.codename=$(FLEXO_CODENAME) \
    ro.flexo.maintainer=$(FLEXO_MAINTAINER)\
    ro.altho.settings.android_version=$(ALTHO_PLATFORM_RELEASE_OR_CODENAME)
