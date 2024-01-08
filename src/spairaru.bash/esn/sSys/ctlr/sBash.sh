#!/usr/bin/env bash
# ######################################################################################
# BASH CONTROLLER UTILITY GROUP
#
# File System Map:
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     └─ 🖺 bash
# 	└─ ~
# 	   ├─ 🖺 .bash_aliases
# 	   ├─ 🖺 .bashrc
# 	   ├─ 🖺 .bash_profile
# 	   └─ 🖿 .s.bash
# 	      └─ 🖺 bash
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     └─ 🖺 bash
# 	└─ ~
# 	   ├─ 🖺 .bash_aliases
# 	   ├─ 🖺 .bashrc
# 	   ├─ 🖺 .bash_profile
# 	   └─ 🖿 .bash.d
# 	      └─ 🖺 bash
#
# ######################################################################################
BashCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ALTERNATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# OPTIMIZE
# ======================================================================================
	optmz() {


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


		# MAIN PROCESSES --------

		# [ default_profile_absolute_path ]
		local _dflt_prfl_fl_abs_pf="` \
			s_gtBashPrflPf \
				--dflt
		`"

		# [ default_profile_document_linebreak ]
		local _dflt_prfl_doc_lnbrk="` \
			s_gtDocLnBrkChr \
				"$_dflt_prfl_fl_abs_pf" \
		`" ;

		# [ global_alias_profile_absolute_path ]
		local _glo_aka_prfl_fl_abs_pf="` \
			s_gtBashPrflPf \
				--glo \
		`"

		# [ global_alias_profile_document_linebreak ]
		local _glo_aka_prfl_doc_lnbrk="` \
			s_gtDocLnBrkChr \
				"$_glo_aka_prfl_fl_abs_pf" \
		`" ;

		# [ local_alias_profile_absolute_path ]
		_lcl_aka_prfl_fl_abs_pf="` \
			s_gtBashPrflPf \
				--lo \
		`"


		# MAIN PROCESS : DEFAULT PROFILE --------

		# 1 ) Add Remark

		prfl \
			rmrk \
				"$S_RMRK" \
				--bfr "$_dflt_prfl_doc_lnbrk"'export BASH_ENV=.*' \
			--pf "$_dflt_prfl_fl_abs_pf" \
		;


		# 2 ) Configure Environment

		[[ -z "$BASH_ENV" ]] \
		&& prfl \
			env \
				"BASH_ENV" \
				"$_glo_aka_prfl_fl_abs_pf" \
				--aft "${S_RMRK}${_dflt_prfl_doc_lnbrk}" \
			--pf "$_dflt_prfl_fl_abs_pf" \
		;


		# 2 ) Load Configuration File

		[[ "$_dflt_prfl_fl_abs_pf" != "$_glo_aka_prfl_fl_abs_pf" ]] \
		&& prfl \
			wrt \
				'. "'"$_glo_aka_prfl_fl_abs_pf"'" ;'"$_dflt_prfl_doc_lnbrk" \
				--aft 'export BASH_ENV=.*'"$_dflt_prfl_doc_lnbrk" \
			--pf "$_dflt_prfl_fl_abs_pf" \
		;


		# MAIN PROCESS : ALIAS GLOBAL PROFILE --------

		# 1 ) Add Remark

		# - its not bash
		[[ \
			"` \
			basename \
				"$_glo_aka_prfl_fl_abs_pf" \
			`" \
			!= "bash" \
		]] \
		&& prfl \
			rmrk \
				"$S_RMRK" \
			--pf "$_glo_aka_prfl_fl_abs_pf" \
		;


		# 2 ) Enable Alias Feature

		[[ ! "` \
			shopt -sp \
			| grep "expand_aliases" \
		`" ]] \
		&& prfl \
			wrt \
				'shopt -s expand_aliases ;'"$_glo_aka_prfl_doc_lnbrk" \
				--aft "${S_RMRK}${_glo_aka_prfl_doc_lnbrk}${_glo_aka_prfl_doc_lnbrk}" \
			--pf "$_glo_aka_prfl_fl_abs_pf" \
		;


		# 3 ) Include Local Profile

		[[ "$_glo_aka_prfl_fl_abs_pf" != "$_lcl_aka_prfl_fl_abs_pf" ]] \
		&& prfl \
			wrt \
				"\[\[ \"\\\$USER\" == \"${RL_USR}\" && -f \"${_lcl_aka_prfl_fl_abs_pf}\" \]\] && . \"${_lcl_aka_prfl_fl_abs_pf}\" ;${_glo_aka_prfl_doc_lnbrk}" \
				--aft 'shopt -s expand_aliases.*'"$_glo_aka_prfl_doc_lnbrk" \
			--pf "$_glo_aka_prfl_fl_abs_pf" \
		;


		# POST PROCESS : OUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s is been optimized." \
			"${ANSI_F_OR}`basename bash`${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# VERSION
# 
# Description:
# 	Compare given version with current shell version.
#
# ======================================================================================
	ver() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# ARGUMENT : POSITIONED --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ target_version ]
		local tgt_ver__="${_pax[0]}" ;


		# MAIN PROCESS : GET VERSION --------

		# At 2023, bash version format is like below:
		# 	"GNU bash, version x.x.xx(x)-xxx (xxx)".
		# 	                   ↑↑↑↑↑↑↑↑↑

		# P 			: use regex
		# o 			: display matched only

		# version\s 			: contains version and space
		# \K 					: capture from here
		# .+? 					: match anything with or without next condition
		# (?=-|\s|\$) 			: capture untill next hyphen or space or till very end

		# [ current_version ]
		local _cur_ver="` \
			bash \
				--version \
			| grep \
				-Po \
				"version\s\K.+?(?=\-|\s|\$)" \
			| head \
				-1 \
		`" ;


		# MAIN PROCESS : COMPARE VERSION --------

		# - target_version is set
		if [[ -n "$tgt_ver__" ]] ;
		then

			s_compVer \
				"$_cur_ver" \
				"$tgt_ver__" \
			;

			_rslt=$? ;


		# MAIN PROCESS : CURRENT VERSION --------

		else

			echo "$_cur_ver" ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


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


		# [ alias ]
		local aka__="${_pax[0]}" ;


		# PRECHECK : ALIAS --------

		if [[ -z $aka__ ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Alias Name" \
				"1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : DETERMINE ALIAS --------

		[[ \
			"` \
				bash \
					"\
						type \
							-t \
							$aka__ \
					" \
				2>/dev/null \
			`" \
			== "alias"
		]] \
		&& _rslt=$tru \
		|| _rslt=$fls \
		;


		# POST PROCESS : OUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_ShAka \
			--stt $_rslt \
			--sh "`basename bash`" \
			--aka $aka__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# COMMAND LINE INTERFACE
# 
# Description:
# 	Add or Remove command line in cofiguration file.
#
# ======================================================================================
	cli() {


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


		# [ commnad ]
		local cmd__="${_pax[0]}" ;


		# PRECHECK : COMMNAD --------

		if [[ -z $cmd__ ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Command" \
				"1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : DETERMINE --------

		[[ "` \
			bash \
				"\
					type \
						-t \
						$cmd__ \
				" \
			2>/dev/null \
		`" ]] \
		&& _rslt=$tru \
		|| _rslt=$fls \
		;


		# POST PROCESS : OUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_ShCli \
			--stt $_rslt \
			--sh "`basename bash`" \
			--cmd $cmd__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# PROFILE
# 
# Description:
# 	Get or Open cofiguration files.
#
# ======================================================================================
	prfl() {


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


		# PRE PROCESS : DETERMINE PROFILE --------

		# [ profile_file_absolute_path ]
		local _prfl_fl_abs_pf="` \
			s_gtBashPrflPf \
				"$@" \
		`" ;


		# PRECHECK : PROFILE --------

		if [[ -z "$_prfl_fl_abs_pf" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s%s has not found." \
				"${ANSI_F_OR}`basename bash`${_ANSI}" \
				"profile" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : EDIT PROFILE --------

		ShPrflMdl \
			"$@" \
			--pf "$_prfl_fl_abs_pf" \
			--sh "`basename bash`" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	isIstld() {


		type \
			-t \
			bash \
			&>/dev/null \
		&& return $tru \
		|| return $fls \
		;


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

	return $fls ;


) ;
