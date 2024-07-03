include $(TOPDIR)/rules.mk

PKG_NAME:=kmod-tcp-md5sig
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CONFIG_DEPENDS := CONFIG_TCP_MD5SIG

include $(INCLUDE_DIR)/kernel.mk

define KernelPackage/tcp-md5sig
  TITLE:=Kernel support for TCP MD5 Signature
  DEPENDS:=+kmod-crypto-hash +kmod-lib-crc32c
  FILES:=$(LINUX_DIR)/net/ipv4/tcp_md5.o
  AUTOLOAD:=$(call AutoLoad,99,tcp_md5)
  KCONFIG:=CONFIG_TCP_MD5SIG
  PROVIDES:=tcp-md5
endef

define Build/Prepare
    mkdir -p $(PKG_BUILD_DIR)
    $(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
    $(MAKE) -C "$(LINUX_DIR)" \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SUBDIRS="$(PKG_BUILD_DIR)" \
        modules
endef

$(eval $(call KernelPackage,tcp-md5sig))
