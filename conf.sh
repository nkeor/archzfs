# ZFSonLinux stable version (LTS packages)
AZB_ZOL_VERSION="0.6.5.4"

# Kernel version for GIT packages
AZB_GIT_SPL_COMMIT="6e5e068f"
AZB_GIT_ZFS_COMMIT="1ffc4c15"
AZB_GIT_PKGREL="1"
AZB_GIT_KERNEL_VERSION="4.4.3"
AZB_GIT_KERNEL_X32_PKGREL="1"
AZB_GIT_KERNEL_X64_PKGREL="1"
AZB_GIT_KERNEL_X32_VERSION="${AZB_GIT_KERNEL_VERSION}-${AZB_GIT_KERNEL_X32_PKGREL}"
AZB_GIT_KERNEL_X64_VERSION="${AZB_GIT_KERNEL_VERSION}-${AZB_GIT_KERNEL_X64_PKGREL}"

# Kernel versions for LTS packages
AZB_LTS_PKGREL="1"
AZB_LTS_KERNEL_VERSION="4.1.19"
AZB_LTS_KERNEL_X32_PKGREL="1"
AZB_LTS_KERNEL_X64_PKGREL="1"
AZB_LTS_KERNEL_X32_VERSION="${AZB_LTS_KERNEL_VERSION}-${AZB_LTS_KERNEL_X32_PKGREL}"
AZB_LTS_KERNEL_X64_VERSION="${AZB_LTS_KERNEL_VERSION}-${AZB_LTS_KERNEL_X64_PKGREL}"

# Archiso Configuration
AZB_ARCHISO_PKGREL="1"
AZB_KERNEL_ARCHISO_VERSION="4.4.1"
AZB_KERNEL_ARCHISO_X32_PKGREL="2"
AZB_KERNEL_ARCHISO_X64_PKGREL="2"
AZB_KERNEL_ARCHISO_X32_VERSION="${AZB_KERNEL_ARCHISO_VERSION}-${AZB_KERNEL_ARCHISO_X32_PKGREL}"
AZB_KERNEL_ARCHISO_X64_VERSION="${AZB_KERNEL_ARCHISO_VERSION}-${AZB_KERNEL_ARCHISO_X64_PKGREL}"

# Testing repo Linux version dependencies
# AZB_KERNEL_TEST_VERSION="3.13.8"
# AZB_KERNEL_TEST_X32_PKGREL="1"
# AZB_KERNEL_TEST_X64_PKGREL="1"
# AZB_KERNEL_TEST_X32_VERSION="${AZB_KERNEL_TEST_VERSION}-${AZB_KERNEL_TEST_X32_PKGREL}"
# AZB_KERNEL_TEST_X64_VERSION="${AZB_KERNEL_TEST_VERSION}-${AZB_KERNEL_TEST_X64_PKGREL}"
# AZB_KERNEL_TEST_PKG_VERSION="${AZB_ZOL_VERSION}_${AZB_KERNEL_TEST_VERSION}"
# AZB_KERNEL_TEST_FULL_VERSION="${AZB_KERNEL_TEST_PKG_VERSION}-${AZB_GIT_PKGREL}"

# Notification address
AZB_EMAIL="jeezusjr@gmail.com"

# Repository path and name
AZB_REPO_BASEPATH="/data/pacman/repo"

# SSH login address (can use ssh config Hosts)
AZB_REMOTE_LOGIN="webfaction"

# The signing key to use to sign packages
AZB_GPG_SIGN_KEY='0EE7A126'

# Package backup directory (for adding packages to demz-repo-archiso)
AZB_PACKAGE_BACKUP_DIR="/data/pacman/repo/archive_archzfs"

AZB_GIT_PKG_LIST="spl-utils-git spl-git zfs-utils-git zfs-git"
AZB_LTS_PKG_LIST="spl-utils-lts spl-lts zfs-utils-lts zfs-lts"
