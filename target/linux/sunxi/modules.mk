#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

define KernelPackage/rtc-sunxi
    SUBMENU:=$(OTHER_MENU)
    TITLE:=Sunxi SoC built-in RTC support
    DEPENDS:=@TARGET_sunxi
    $(call AddDepends/rtc)
    KCONFIG:= \
	CONFIG_RTC_CLASS=y \
	CONFIG_RTC_DRV_SUNXI=m
    FILES:=$(LINUX_DIR)/drivers/rtc/rtc-sunxi.ko
    AUTOLOAD:=$(call AutoLoad,50,rtc-sunxi)
endef

define KernelPackage/rtc-sunxi/description
 Support for the AllWinner sunXi SoC's onboard RTC
endef

$(eval $(call KernelPackage,rtc-sunxi))

define KernelPackage/sunxi-ir
    SUBMENU:=$(OTHER_MENU)
    TITLE:=Sunxi SoC built-in IR support (A20)
    DEPENDS:=@TARGET_sunxi +kmod-input-core
    $(call AddDepends/rtc)
    KCONFIG:= \
	CONFIG_MEDIA_SUPPORT=y \
	CONFIG_MEDIA_RC_SUPPORT=y \
	CONFIG_RC_DEVICES=y \
	CONFIG_IR_SUNXI
    FILES:=$(LINUX_DIR)/drivers/media/rc/sunxi-cir.ko
    AUTOLOAD:=$(call AutoLoad,50,sunxi-cir)
endef

define KernelPackage/sunxi-ir/description
 Support for the AllWinner sunXi SoC's onboard IR (A20)
endef

$(eval $(call KernelPackage,sunxi-ir))

define KernelPackage/eeprom-sunxi
    SUBMENU:=$(OTHER_MENU)
    TITLE:=AllWinner Security ID fuse support
    DEPENDS:=@TARGET_sunxi
    KCONFIG:= \
	CONFIG_EEPROM_SUNXI_SID
    FILES:=$(LINUX_DIR)/drivers/misc/eeprom/sunxi_sid.ko
    AUTOLOAD:=$(call AutoLoad,50,sunxi_sid)
endef

define KernelPackage/eeprom-sunxi/description
 Support for the AllWinner Security ID fuse support
endef

$(eval $(call KernelPackage,eeprom-sunxi))

define KernelPackage/ata-sunxi
    TITLE:=AllWinner sunXi AHCI SATA support
    SUBMENU:=$(BLOCK_MENU)
    DEPENDS:=@TARGET_sunxi +kmod-ata-ahci-platform +kmod-scsi-core
    KCONFIG:=CONFIG_AHCI_SUNXI
    FILES:=$(LINUX_DIR)/drivers/ata/ahci_sunxi.ko
    AUTOLOAD:=$(call AutoLoad,41,ahci_sunxi,1)
endef

define KernelPackage/ata-sunxi/description
 SATA support for the AllWinner sunXi SoC's onboard AHCI SATA
endef

$(eval $(call KernelPackage,ata-sunxi))

define KernelPackage/sun4i-emac
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  TITLE:=AllWinner EMAC Ethernet support
  DEPENDS:=@TARGET_sunxi
  KCONFIG:=CONFIG_SUN4I_EMAC
  FILES:=$(LINUX_DIR)/drivers/net/ethernet/allwinner/sun4i-emac.ko
  AUTOLOAD:=$(call AutoProbe,sun4i-emac)
endef

$(eval $(call KernelPackage,sun4i-emac))


define KernelPackage/wdt-sunxi
    SUBMENU:=$(OTHER_MENU)
    TITLE:=AllWinner sunXi Watchdog timer
    DEPENDS:=@TARGET_sunxi
    KCONFIG:=CONFIG_SUNXI_WATCHDOG
    FILES:=$(LINUX_DIR)/drivers/$(WATCHDOG_DIR)/sunxi_wdt.ko
    AUTOLOAD:=$(call AutoLoad,51,sunxi_wdt)
endef

define KernelPackage/wdt-sunxi/description
    Kernel module for AllWinner sunXi watchdog timer.
endef

$(eval $(call KernelPackage,wdt-sunxi))


define KernelPackage/sound-soc-sunxi
  TITLE:=AllWinner built-in SoC sound support
  KCONFIG:= \
	CONFIG_SND_SUNXI_SOC_CODEC
  FILES:= \
	$(LINUX_DIR)/sound/soc/sunxi/sunxi-codec.ko
  AUTOLOAD:=$(call AutoLoad,65,sunxi-codec)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sunxi/description
  Kernel support for AllWinner built-in SoC audio
endef

$(eval $(call KernelPackage,sound-soc-sunxi))


define KernelPackage/sound-soc-sunxi-i2s
  TITLE:=AllWinner SoC sound I2S support
  KCONFIG:= \
	CONFIG_SND_SUNXI_SOC_I2S
  FILES:= \
	$(LINUX_DIR)/sound/soc/sunxi/sunxi-i2s.ko
  AUTOLOAD:=$(call AutoLoad,65,sunxi-i2s)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sunxi-i2s/description
  Kernel support for AllWinner SoC I2S audio
endef

$(eval $(call KernelPackage,sound-soc-sunxi-i2s))


define KernelPackage/sound-soc-sunxi-spdif
  TITLE:=AllWinner SoC sound SPDIF support
  KCONFIG:= \
	CONFIG_SND_SUNXI_DAI_SPDIF \
	CONFIG_SND_SUNXI_MACHINE_SPDIF
  FILES:= \
	$(LINUX_DIR)/sound/soc/sunxi/snd-soc-sunxi-dai-spdif.ko \
	$(LINUX_DIR)/sound/soc/sunxi/snd-soc-sunxi-machine-spdif.ko
  AUTOLOAD:=$(call AutoLoad,65,snd-soc-sunxi-dai-spdif snd-soc-sunxi-machine-spdif)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sunxi-spdif/description
  Kernel support for AllWinner SoC SPDIF audio
endef

$(eval $(call KernelPackage,sound-soc-sunxi-spdif))


