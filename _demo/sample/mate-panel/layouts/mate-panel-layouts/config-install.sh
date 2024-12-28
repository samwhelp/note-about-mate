#!/usr/bin/env bash

set -e


################################################################################
### Head: mate
##

mate_config_install () {

	echo
	echo "##"
	echo "## Config: mate"
	echo "##"
	echo


	mate_config_install_by_dir


	echo

}

mate_config_install_by_dir () {


	echo
	echo "sudo mkdir -p /usr/share/mate-panel/layouts"
	sudo mkdir -p "/usr/share/mate-panel/layouts"


	echo
	echo "sudo cp -rf ./asset/overlay/usr/share/mate-panel/layouts/. /usr/share/mate-panel/layouts"
	sudo cp -rf "./asset/overlay/usr/share/mate-panel/layouts/." "/usr/share/mate-panel/layouts"


}

##
### Tail: mate
################################################################################


################################################################################
### Head: config_install
##

main_config_install () {

	mate_config_install

}

##
### Tail: config_install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_config_install

}

##
## Start
##
__main__

##
### Tail: Main
################################################################################
