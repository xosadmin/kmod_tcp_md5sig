obj-m += tcp_md5.o

all:
    $(MAKE) -C $(LINUX_DIR) \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SUBDIRS="$(PWD)" \
        modules

clean:
    $(MAKE) -C $(LINUX_DIR) \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SUBDIRS="$(PWD)" \
        clean
