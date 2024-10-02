#
# This file is the resnet50 recipe.
#

SUMMARY="Deploy resnet50 sample and xmodel"
SECTION = "PETALINUX/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"


APP_NAME="app"
APP_PACKAGE = "${APP_NAME}.tar.gz"
APP_INSTALL_PATH = "/home/root/"

SRC_URI = "file://${APP_PACKAGE}"

do_install() {

	mkdir -p ${D}
	mkdir -p ${D}/${APP_INSTALL_PATH}
        cp ${WORKDIR}/${APP_NAME} ${D}/${APP_INSTALL_PATH} -r 

	# Due to the way things are copied, we need to
	# potentially correct permissions
	#
	# We first have to clear all set-id perms (chmod won't clear these)
	chmod ug-s -R ${D}/*

	if [ -d ${D}/${LICENSE_FILES_DIRECTORY} ]; then
		# Now make sure the directory is set to 0755
		chmod 0755 ${D}/${LICENSE_FILES_DIRECTORY}
	fi
}

do_package_qa() {
    echo "do nothing"
}


FILES:${PN} += " ${APP_INSTALL_PATH} "
INSANE_SKIP:${PN}:append = " already-stripped "
