# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gstreamer"
PKG_VERSION="1.22.4"
PKG_SHA256="11cb0498bc16b93d8b99d22f75f829b8d0abfd8254840b2120618db5532dc655"
PKG_LICENSE="GPL-2.1-or-later"
PKG_SITE="https://gstreamer.freedesktop.org"
PKG_URL="https://gstreamer.freedesktop.org/src/gstreamer/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain glib glib:host"
PKG_LONGDESC="GStreamer open-source multimedia framework core library"

pre_configure_target() {
  PKG_MESON_OPTS_TARGET="-Dgst_debug=false \
                         -Dgst_parse=true \
                         -Dregistry=false \
                         -Dtracer_hooks=false \
                         -Doption-parsing=true \
                         -Dpoisoning=false \
                         -Dcheck=disabled \
                         -Dlibunwind=disabled \
                         -Dlibdw=disabled \
                         -Ddbghelp=disabled \
                         -Dbash-completion=disabled \
                         -Dcoretracers=disabled \
                         -Dexamples=disabled \
                         -Dtests=disabled \
                         -Dbenchmarks=disabled \
                         -Dtools=disabled \
                         -Ddoc=disabled \
                         -Dintrospection=disabled \
                         -Dnls=disabled \
                         -Dgobject-cast-checks=disabled \
                         -Dglib-asserts=disabled \
                         -Dglib-checks=disabled \
                         -Dextra-checks=disabled \
                         -Dpackage-name="gstreamer"
                         -Dpackage-origin="LibreELEC.tv"
                         -Ddoc=disabled"
}

post_makeinstall_target() {
  # clean up
  safe_remove ${INSTALL}/usr/share
  safe_remove ${INSTALL}/usr/lib/{libgstcontroller-1.0*,libgstnet-1.0*}
}
