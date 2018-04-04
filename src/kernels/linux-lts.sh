# For build.sh
mode_name="lts"
package_base="linux-lts"
mode_desc="Select and use the packages for the linux-lts kernel"

# Kernel versions for LTS packages
pkgrel="1"
kernel_version="4.14.32-1"

# Kernel version for GIT packages
pkgrel_git="${pkgrel}"
kernel_version_git="${kernel_version}"
zfs_git_commit=""
spl_git_commit=""
zfs_git_url="https://github.com/zfsonlinux/zfs.git"
spl_git_url="https://github.com/zfsonlinux/spl.git"

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
# case, the archzfs-linux-lts packages will only work with the default linux-lts package! To have a single PKGBUILD target
# many kernels would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
#"

update_linux_lts_pkgbuilds() {
    pkg_list=("spl-linux-lts" "zfs-linux-lts")
    kernel_version_full=$(kernel_version_full ${kernel_version})
    kernel_version_full_pkgver=$(kernel_version_full_no_hyphen ${kernel_version})
    kernel_version_major=${kernel_version%-*}
    kernel_mod_path="${kernel_version_full}-lts"
    archzfs_package_group="archzfs-linux-lts"
    spl_pkgver=${zol_version}.${kernel_version_full_pkgver}
    zfs_pkgver=${zol_version}.${kernel_version_full_pkgver}
    spl_pkgrel=${pkgrel}
    zfs_pkgrel=${pkgrel}
    spl_conflicts="'spl-linux-lts-git'"
    zfs_conflicts="'zfs-linux-lts-git'"
    spl_pkgname="spl-linux-lts"
    spl_utils_pkgname="spl-utils-common=${zol_version}"
    zfs_pkgname="zfs-linux-lts"
    zfs_utils_pkgname="zfs-utils-common=${zol_version}"
    # Paths are relative to build.sh
    spl_pkgbuild_path="packages/${kernel_name}/${spl_pkgname}"
    zfs_pkgbuild_path="packages/${kernel_name}/${zfs_pkgname}"
    spl_src_target="https://github.com/zfsonlinux/zfs/releases/download/zfs-${zol_version}/spl-${zol_version}.tar.gz"
    zfs_src_target="https://github.com/zfsonlinux/zfs/releases/download/zfs-${zol_version}/zfs-${zol_version}.tar.gz"
    spl_workdir="\${srcdir}/spl-${zol_version}"
    zfs_workdir="\${srcdir}/zfs-${zol_version}"
    linux_depends="\"linux-lts=${kernel_version_major}\""
    linux_headers_depends="\"linux-lts-headers=${kernel_version_major}\""
    spl_makedepends="\"libelf\""
    zfs_makedepends="\"libelf\" \"${spl_pkgname}-headers\""
}

update_linux_lts_git_pkgbuilds() {
    pkg_list=("spl-linux-lts-git" "zfs-linux-lts-git")
    kernel_version=${kernel_version_git}
    kernel_version_full=$(kernel_version_full ${kernel_version})
    kernel_version_full_pkgver=$(kernel_version_full_no_hyphen ${kernel_version})
    kernel_version_major=${kernel_version%-*}
    kernel_mod_path="${kernel_version_full}-lts"
    archzfs_package_group="archzfs-linux-lts-git"
    spl_pkgver="" # Set later by call to git_calc_pkgver
    zfs_pkgver="" # Set later by call to git_calc_pkgver
    spl_pkgrel=${pkgrel_git}
    zfs_pkgrel=${pkgrel_git}
    spl_conflicts="'spl-linux-lts'"
    zfs_conflicts="'zfs-linux-lts'"
    spl_pkgname="spl-linux-lts-git"
    zfs_pkgname="zfs-linux-lts-git"
    spl_pkgbuild_path="packages/${kernel_name}/${spl_pkgname}"
    zfs_pkgbuild_path="packages/${kernel_name}/${zfs_pkgname}"
    spl_src_target="git+${spl_git_url}"
    spl_src_hash="SKIP"
    linux_depends="\"linux-lts=${kernel_version_full}\""
    linux_headers_depends="\"linux-lts-headers=${kernel_version_full}\""
    spl_makedepends="\"libelf\" \"git\""
    zfs_src_target="git+${zfs_git_url}"
    zfs_src_hash="SKIP"
    zfs_makedepends="\"libelf\" \"git\" \"${spl_pkgname}-headers\""
    spl_workdir="\${srcdir}/spl"
    zfs_workdir="\${srcdir}/zfs"
    if have_command "update"; then
        git_check_repo
        git_calc_pkgver
    fi
    spl_utils_pkgname="spl-utils-common-git=${spl_git_ver}"
    zfs_utils_pkgname="zfs-utils-common-git=${zfs_git_ver}"
    spl_src_target="git+${spl_git_url}#commit=${latest_spl_git_commit}"
    zfs_src_target="git+${zfs_git_url}#commit=${latest_zfs_git_commit}"
}
