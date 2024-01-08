#!/usr/bin/env bash
# ######################################################################################
# ANSI DEFINE
# ######################################################################################

# ansi_open_escape
[[ -z "$ANSI_" ]] \
&& declare -r ANSI_="\033[" \
;

# ansi_close_tag
[[ -z "$_ANSI" ]] \
&& declare -r _ANSI="${ANSI_}0m" \
;
