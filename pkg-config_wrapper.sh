#!/bin/sh
PKG_CONFIG_SYSROOT_DIR=/opt/fsl-imx-xwayland/4.14-sumo/sysroots/cortexa9hf-neon-poky-linux-gnueabi
export PKG_CONFIG_SYSROOT_DIR
PKG_CONFIG_LIBDIR=/opt/fsl-imx-xwayland/4.14-sumo/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/lib/pkgconfig:/opt/fsl-imx-xwayland/4.14-sumo/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/share/pkgconfig:/opt/fsl-imx-xwayland/4.14-sumo/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/lib/arm-poky-linux-gnueabi/pkgconfig
export PKG_CONFIG_LIBDIR
exec pkg-config "$@"
