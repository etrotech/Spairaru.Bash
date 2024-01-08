#!/usr/bin/env bash
# ######################################################################################
# SHELL UTILITY
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BASH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# GET BASH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtBashPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--prfl_fl_abs_pf "fl" "file" "pf" "path" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-nov 1 \
			--prfl_scp-dflt "lo" \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$prfl_fl_abs_pf" ]] ;
	then

		_prfl_fl_abs_pf="$prfl_fl_abs_pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 EtroTech spairaru.bash
	# 	│     └─ 🖺 bash
	# 	└─ $HOME
	# 	   ├─ 🖺 .bash_aliases
	# 	   ├─ 🖺 .bashrc 👈 1
	# 	   ├─ 🖺 .bash_profile 👈 2
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 bash

	# - scope is default
	elif [[ "$prfl_scp" == "dflt" ]] ;
	then


		# $HOME/.bashrc
		[[ -f "${RL_HM}/.bashrc" ]] \
		&& _prfl_fl_abs_pf="${RL_HM}/.bashrc" \
		;


		# $HOME/.bash_profile
		[[ \
			-z "$_prfl_fl_abs_pf" \
			&& -f "${RL_HM}/.bash_profile" \
		]] \
		&& _prfl_fl_abs_pf="${RL_HM}/.bash_profile" \
		;


	# C ) GLOBAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 /EtroTech spairaru.bash 
	# 	│     └─ 🖺 bash 👈 2
	# 	└─ $HOME
	# 	   ├─ 🖺 .bash_aliases 👈 1
	# 	   ├─ 🖺 .bashrc
	# 	   ├─ 🖺 .bash_profile
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 bash

	# - scope is global
	elif [[ "$prfl_scp" == "glo" ]] ;
	then


		[[ -n "$BASH_ENV" ]] \
		&& _prfl_fl_abs_pf="$BASH_ENV" \
		;


		# $HOME/.bash_aliases
		[[ \
			-z "$_prfl_fl_abs_pf" \
			&& -f "${RL_HM}/.bash_aliases" \
		]] \
		&& _prfl_fl_abs_pf="${RL_HM}/.bash_aliases" \
		;


		# etc/spairaru.bash/bash
		[[ -z "$_prfl_fl_abs_pf" ]] \
		&& _prfl_fl_abs_pf="$S_D_CNF_FLDR/bash" \
		;


	# D ) LOCAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 /EtroTech spairaru.bash 
	# 	│     └─ 🖺 bash
	# 	└─ $HOME
	# 	   ├─ 🖺 .bash_aliases 👈 1
	# 	   ├─ 🖺 .bashrc
	# 	   ├─ 🖺 .bash_profile
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 bash 👈 2

	# - otherwise
	else


		[[ -n "$BASH_ENV" ]] \
		&& _prfl_fl_abs_pf="$BASH_ENV" \
		;


		# $HOME/.bash_aliases
		[[ \
			-z "$_prfl_fl_abs_pf" \
			&& -f "${RL_HM}/.bash_aliases" \
		]] \
		&& _prfl_fl_abs_pf="${RL_HM}/.bash_aliases" \
		;


		# $HOME/.spairaru.bash/bash
		[[ -z "$_prfl_fl_abs_pf" ]] \
		&& _prfl_fl_abs_pf="$S_G_CNF_FLDR/bash" \
		;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo $_prfl_fl_abs_pf ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CSH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# GET CSH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtCshPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--prfl_fl_abs_pf "fl" "file" "pf" "path" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-nov 1 \
			--prfl_scp-dflt "lo" \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$prfl_fl_abs_pf" ]] ;
	then

		_prfl_fl_abs_pf="$prfl_fl_abs_pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	└─ 🖿 $HOME
	# 	   └─ 🖺 .cshrc 👈

	# - otherwise
	else
	
		_prfl_fl_abs_pf="${RL_HM}/.cshrc" ;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo $_prfl_fl_abs_pf ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FISH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# GET FISH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtFishPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--prfl_fl_abs_pf "fl" "file" "pf" "path" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-nov 1 \
			--prfl_scp-dflt "lo" \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$prfl_fl_abs_pf" ]] ;
	then

		_prfl_fl_abs_pf="$prfl_fl_abs_pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	└─ 🖿 $HOME
	# 	   └─ 🖿 .config
	# 	      └─ 🖿 fish
	# 	         └─ 🖺 config.fish 👈

	# - otherwise
	else

		_prfl_fl_abs_pf="${RL_HM}/.config/fish/config.fish" ;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo $_prfl_fl_abs_pf ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TCSH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# GET TCSH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtTcshPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--prfl_fl_abs_pf "fl" "file" "pf" "path" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-nov 1 \
			--prfl_scp-dflt "lo" \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$prfl_fl_abs_pf" ]] ;
	then

		_prfl_fl_abs_pf="$prfl_fl_abs_pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	└─ 🖿 $HOME
	# 	   └─ 🖺 .tcshrc 👈

	# - otherwise
	else

		_prfl_fl_abs_pf="${RL_HM}/.tcshrc" ;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo $_prfl_fl_abs_pf ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ZSH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# GET ZSH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtZshPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--prfl_fl_abs_pf "fl" "file" "pf" "path" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-nov 1 \
			--prfl_scp-dflt "lo" \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$prfl_fl_abs_pf" ]] ;
	then

		_prfl_fl_abs_pf="$prfl_fl_abs_pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	└─ 🖿 $HOME
	# 	   └─ 🖺 .zshrc 👈

	# - otherwise
	else

		_prfl_fl_abs_pf="${RL_HM}/.zshrc" ;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo $_prfl_fl_abs_pf ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
