#!/usr/bin/env bash
# ######################################################################################
# SHELL PROFILE MODLE UTILITY GROUP
# ######################################################################################
ShPrflMdl() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ACTIONAL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# COMMENT OUT
# 
# Description:
# 	Add comment remark to target lanes in cofiguration file.
#
# ======================================================================================
	co() {


		# MAIN PROCESSES --------

		s \
			doc \
				co \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UNCOMMENT
# 
# Description:
# 	Remove comment remark from target lanes in cofiguration file.
#
# ======================================================================================
	uc() {


		# MAIN PROCESSES --------

		s \
			doc \
				uc \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# REMARK
# 
# Description:
# 	Add or Remove remarks in cofiguration file.
#
# ======================================================================================
	rmrk() {


		# MAIN PROCESSES --------

		s \
			doc \
				rmrk \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ALIAS
# 
# Description:
# 	Add or Remove command alias in cofiguration file.
#
# ======================================================================================
	aka() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# HELP --------

		s_isHlp \
			"$@" \
		&& echo "" \
		&& return $tru \
		;


		# VERSION --------

		s_isVer \
			"$@" \
		&& echo "" \
		&& return $tru \
		;


		# ARGUMENT : POSITIONED --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ command ]
		local cmd__="${_pax[1]}" ;


		# PRE PROCESS : ACTION --------

		if [[ -z "$atn" ]] ;
		then

			[[ "$cmd__" ]] \
			&& atn="ad" \
			|| atn="qry" \
			;

		fi ;


		# [ action ]
		local _atn="$atn" ;

		[[ "$_atn" == "dl" ]] \
		&& _atn="rm" \
		;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : COMMAND --------

		# - its add action
		# - command is not set
		if [[ \
			$atn == "ad" \
			&& -z "$cmd__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Command" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty="alias ${ky__}=\"${cmd__// /\\\\\ }\" ;" ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$_atn \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& s_ivkPptTpl_DocMnpAtnx \
			--atn $atn \
			\
			--stt $_rslt \
			\
			--tgt_cat "${ANSI_F_OR}${sh}${_ANSI} `__ "command alias"`" \
			--tgt_ttl "${ANSI_F_GN}${ky__}${_ANSI}" \
			\
			--doc_cat "profile" \
			--doc_ttl "$_prfl_ttl" \
			--doc_pf "$prfl_fl_abs_pf" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# ENVIRONMENT
# 
# Description:
# 	Add or Remove environment key in cofiguration files.
#
# ======================================================================================
	env() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# HELP --------

		s_isHlp \
			"$@" \
		&& echo "" \
		&& return $tru \
		;


		# VERSION --------

		s_isVer \
			"$@" \
		&& echo "" \
		&& return $tru \
		;


		# ARGUMENT : POSITIONED --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ value ]
		local vlu__="${_pax[1]}" ;


		# PRE PROCESS : ACTION --------

		if [[ -z "$atn" ]] ;
		then

			[[ "$vlu__" ]] \
			&& atn="ad" \
			|| atn="qry" \
			;

		fi ;


		# [ action ]
		local _atn="$atn" ;

		[[ "$_atn" == "dl" ]] \
		&& _atn="rm" \
		;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : VALUE --------

		# - its add action
		# - value is not set
		if [[ \
			$atn == "ad" \
			&& -z "$vlu__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Value" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty="export ${ky__}=\"${vlu__}\" ;" ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$_atn \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& s_ivkPptTpl_DocMnpAtnx \
			--atn $atn \
			\
			--stt $_rslt \
			\
			--tgt_cat "${ANSI_F_OR}${sh}${_ANSI} `__ "environment key"`" \
			--tgt_ttl "${ANSI_F_GN}${ky__}${_ANSI}" \
			\
			--doc_cat "profile" \
			--doc_ttl "$_prfl_ttl" \
			--doc_pf "$prfl_fl_abs_pf" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ERASE
# 
# Description:
# 	Remove lanes from cofiguration file.
#
# ======================================================================================
	ers() {


		# MAIN PROCESSES --------

		s \
			doc \
				ers \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


	} ;



# ======================================================================================
# RELAOD
# 
# Description:
# 	Import in cofiguration file in shell.
#
# ======================================================================================
	rld() {


		# MAIN PROCESSES --------

		. "$prfl_fl_abs_pf" ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ======================================================================================
# WRITE
# 
# Description:
# 	Add lanes to cofiguration file.
#
# ======================================================================================
	wrt() {


		# MAIN PROCESSES --------

		s \
			doc \
				wrt \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================

	# [ arguments ]
	local -a _ax=("$@") ;


	# HELP --------

	s_isHlp \
		"$@" \
	&& echo "" \
	&& return $tru \
	;


	# VERSION --------

	s_isVer \
		"$@" \
	&& echo "" \
	&& return $tru \
	;


	# ARGUMENT : POSITIONED --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--prfl_fl_abs_pf "fl" "file" "pf" "path" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-nov 1 \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
			\
			--atn "action" \
			--atn-nov 1 \
			--atn-opt-ad "ad" "add" \
			--atn-opt-dl "dl" "delete" \
			--atn-opt-qry "qry" "query" \
			\
			--sh "shell" \
			--sh-nov 1 \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;

	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ shell ]
	local sh="${_nax[sh]}" ;


	# MAGIC PROCESS : PATH --------

	# - action is path
	[[ $mtd__ =~ ^(pf|path)$ ]] \
	&& echo "$prfl_fl_abs_pf" \
	&& return $tru \
	;


	# PRE PROCESS : PROFILE TITLE --------

	# - profile_path is giving
	# - profile_scope is not giving
	if [[ \
		-n "$prfl_fl_abs_pf" \
		&& -z "$prfl_scp" \
	]] ;
	then

		for scp in "dflt" "glo" "lo" ;
		do

			[[
				"` \
				"s_gt${sh^}PrflPf" \
					--scp $scp \
				`" \
				== "$prfl_fl_abs_pf" \
			]] \
			&& prfl_scp="$scp" \
			;

		done ;

	fi ;


	[[ -z "$prfl_scp" ]] \
	&& prfl_scp="cstm" \
	;


	# [ profile_title ]
	local _prfl_ttl="` \
		s_gtPrflTtl \
			"$prfl_scp" \
	`" ;


	# PRE PROCESS : DOCUMENT OPTIONS --------

	# [ document_options ]
	local -a _doc_optx=` \
		s_gtDocOptx \
			"$@" \
	` ;


	# PRE PROCESS : PROFILE --------

	if [[ $atn != "qry" ]] ;
	then


		# - file does not exists
		! s \
			fl \
				ex \
					"$prfl_fl_abs_pf" \
		&& s \
			fl \
				mk \
					"$prfl_fl_abs_pf" \
			--vbo $fls \
		;


		# - file its global profile
		[[ \
			"` \
			basename \
				"$prfl_fl_abs_pf" \
			`" \
			== "${sh}" \
		]] \
		&& rmrk \
			"$S_RMRK" \
			--hdr \
		;


	fi ;


	# MAIN PROCESS : METHOD --------

	# - action is callable
	if [[ "`
		type \
			-t \
			$mtd__ \
			2>/dev/null \
	`" ]] ;
	then


		shift 1 ;


		"$mtd__" \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


) ;
