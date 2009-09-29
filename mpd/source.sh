#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#--------------------------
##	@Synopsis	Mpd management module
##	@Copyright	Copyright 2009, James Pic
##	@License	Apache
#--------------------------

#--------------------------
## Declares module configuration variable names.
#--------------------------
function mpd_source() {
    unset mpd_variables
    mpd_variables+=("host")
    mpd_variables+=("port")
    mpd_variables+=("password")
    mpd_variables+=("client")
    mpd_variables+=("player")
    mpd_variables+=("screenrc")
    mpd_variables+=("url")
    # prefix variable names
    mpd_variables=("${mpd_variables[@]/#/mpd_}")

    jpic_module_source mpd functions.sh
    jpic_module_source mpd conf.sh

    mpd_defaults_setter
}

#--------------------------
## Sets the default mpd interval to 7200 and conf path to ~/.mpd
#--------------------------
function mpd_defaults_setter() {
    mpd_player=mplayer
    mpd_client=ncmpc
    mpd_screenrc=${HOME}/include/shell/mpd/etc/screenrc
    mpd_conf_path=${HOME}/.mpd
}

#--------------------------
## Load configuration on init
#--------------------------
function mpd_init() {
    mpd_conf_load
}
