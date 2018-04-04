# For build.sh
mode_name="iso"
package_base="archiso-linux"
mode_desc="Select and use the packages for the archiso linux kernel"

# Kernel versions for LTS packages
pkgrel="1"
kernel_version="4.15.14-1"

header="\
# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-archiso-linux packages will only work with the archiso ISO! To have a single PKGBUILD target many kernels
# would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
#"

update_archiso_linux_pkgbuilds() {
    pkg_list=("spl-archiso-linux" "zfs-archiso-linux")
    kernel_version_full=$(kernel_version_full ${kernel_version})
    kernel_version_full_pkgver=$(kernel_version_full_no_hyphen ${kernel_version})
    kernel_version_major=${kernel_version%-*}
    kernel_mod_path="${kernel_version_full}-ARCH"
    archzfs_package_group="archzfs-archiso-linux"
    spl_pkgver=${zol_version}_${kernel_version_full_pkgver}
    zfs_pkgver=${zol_version}_${kernel_version_full_pkgver}
    spl_pkgrel=${pkgrel}
    zfs_pkgrel=${pkgrel}
    spl_utils_pkgname="spl-utils-common=${zol_version}"
    spl_pkgname="spl-archiso-linux"
    zfs_utils_pkgname="zfs-utils-common=${zol_version}"
    zfs_pkgname="zfs-archiso-linux"
    spl_pkgbuild_path="packages/${kernel_name}/${spl_pkgname}"
    zfs_pkgbuild_path="packages/${kernel_name}/${zfs_pkgname}"
    spl_src_target="https://github.com/zfsonlinux/zfs/releases/download/zfs-${zol_version}/spl-${zol_version}.tar.gz"
    zfs_src_target="https://github.com/zfsonlinux/zfs/releases/download/zfs-${zol_version}/zfs-${zol_version}.tar.gz"
    spl_workdir="\${srcdir}/spl-${zol_version}"
    zfs_workdir="\${srcdir}/zfs-${zol_version}"
    linux_depends="\"linux=${kernel_version_major}\""
    linux_headers_depends="\"linux-headers=${kernel_version_major}\""
    zfs_makedepends="\"${spl_pkgname}-headers\""
}
