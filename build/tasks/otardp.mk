CUSTOM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(CUSTOM_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum
MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: otardppackage
otardppackage: $(INTERNAL_OTA_RETROFIT_DYNAMIC_PARTITIONS_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_RETROFIT_DYNAMIC_PARTITIONS_PACKAGE_TARGET) $(CUSTOM_TARGET_PACKAGE)
	$(hide) $(SHA256) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).sha256sum
	$(hide) $(MD5) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/aosp/build/tasks/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) $(CUSTOM_VERSION).zip $(PM_BASE_VERSION)
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"    ____  _          _ "${CL_CYN}
	@echo -e ${CL_CYN}"   |  _ \(_)_  _____| |"${CL_CYN}
	@echo -e ${CL_CYN}"   | |_) | \ \/ / _ \ |"${CL_CYN}
	@echo -e ${CL_CYN}"   |  __/| |>  <  __/ |"${CL_CYN}
	@echo -e ${CL_CYN}"   |_|   |_/_/\_\___|_|"${CL_CYN}
	@echo -e ${CL_CYN}" __  __             _      "${CL_CYN}
	@echo -e ${CL_CYN}"|  \/  | ____  ____(_) ___ "${CL_CYN}
	@echo -e ${CL_CYN}"| |\/| |/ _  |/ _  | |/ __|"${CL_CYN}
	@echo -e ${CL_CYN}"| |  | | (_| | (_| | | (__ "${CL_CYN}
	@echo -e ${CL_CYN}"|_|  |_|\__,_|\__, |_|\___|"${CL_CYN}
	@echo -e ${CL_CYN}"              |___/   "${CL_CYN}
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"===========-Package Completed-==========="${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(CUSTOM_TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"MD5: "${CL_YLW}" `cat $(CUSTOM_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"SHA256: "${CL_YLW}" `sha256sum $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size: "${CL_YLW}" `ls -l $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 5` "${CL_RST}
	@echo -e ${CL_CYN}"===========-----Enjoy :)-----==========="${CL_RST}
	@echo -e ""
