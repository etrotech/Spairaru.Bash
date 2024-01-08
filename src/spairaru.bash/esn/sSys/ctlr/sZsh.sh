#!/usr/bin/env bash
# ######################################################################################
# ZSH CONTROLLER UTILITY GROUP
#
# File System Map:
# 	🛠️
# 	└─ 🖿 $HOME
# 	   └─ 🖺 .zshrc
#
# ######################################################################################
ZshCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ALTERNATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ABJUST TO
# 
# Description:
# 	Configure current shell environment to target shell.
#
# ======================================================================================
	abj2() {


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


		# [ shell ]
		local sh__="${_pax[0]}" ;


		# PRECHECK : SHELL --------

		if [[ -z $sh__ ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Shell Command" \
				"1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : REMARK --------

		# [ current_shell_default_profile_file_absolute_path ]
		local _cur_sh_dflt_prfl_fl_abs_pf="` \
			s_gtZshPrflPf \
		`"

		# [ current_shell_default_profile_document_linebreak ]
		local _cur_sh_dflt_prfl_doc_lnbrk="` \
			s_gtDocLnBrkChr \
				"$_cur_sh_dflt_prfl_fl_abs_pf" \
		`" ;


		prfl \
			rmrk \
				"$S_RMRK" \
			--fl "$_cur_sh_dflt_prfl_fl_abs_pf " \
		;


		# MAIN PROCESS : BASH --------

		if [[ $sh__ == "bash" ]] ;
		then


			# [ bash_global_profile_path ]
			local _bash_glo_prfl_fl_abs_pf="` \
				s \
					bash \
						prfl \
							pf \
					--glo \
			`"


			# 1 )  Configure Environment

			[[ ! "$BASH_ENV" ]] \
			&& prfl \
				env \
					"BASH_ENV" \
					"$_bash_glo_prfl_fl_abs_pf" \
					--aft "${S_RMRK}${_cur_sh_dflt_prfl_doc_lnbrk}${_cur_sh_dflt_prfl_doc_lnbrk}" \
				--fl "$_cur_sh_dflt_prfl_fl_abs_pf " \
			;


		fi ;


		# POST PROCESS : OUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_ShAbj2 \
			--stt $_rslt \
			--sh "`basename zsh`" \
			--to $sh__ \
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

		# At 2023, zsh version format is like below: 
		# 	"zsh x.x (xxx)".
		# 	     ↑↑↑

		# P 			: use regex
		# o 			: display matched only

		# zsh\s 				: contains zsh and space
		# \K 					: capture from here
		# .+? 					: match anything with or without next condition
		# (?=\s|\$) 			: capture untill space or till very end

		# [ current_version ]
		local _cur_ver="` \
			zsh \
				--version \
			| grep \
				-Po \
				'zsh\s\K.+?(?=\s|\$)' \
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
				ZshCtlr \
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
			--sh "`basename zsh`" \
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
			ZshCtlr \
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
			--sh "`basename zsh`" \
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
			s_gtZshPrflPf \
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
			--fl "$_prfl_fl_abs_pf" \
			--sh "`basename zsh`" \
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
			zsh \
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
