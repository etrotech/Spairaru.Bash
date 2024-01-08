#!/usr/bin/env bash
# ######################################################################################
# SPAIRARU PACKAGE CONTROLLER UTILITY GROUP
# ######################################################################################
SpairaruCtlr_Pkg() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	SpairaruCtlr_Pkg__istl() {


		# [ result ]
		local _rslt ;


		# MAIN PROCESS : ADD FILES --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltBlkTtl \
			"Adding Configuration Files..." \
			"`__ "${ANSI_F_BL}${S_NM}${_ANSI}"`" \
		;


		SpairaruCtlr_Pkg____istlFlx ;

		_rslt=$? ;


		# MAIN PROCESS : ADD ALIASES --------


		if [[ $_rslt == $tru ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltBlkTtl \
				"Adding Aliases..." \
			;


			SpairaruCtlr_Pkg____istlAkax ;

			_rslt=$? ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "istl" \
			--stt $_rslt \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# UNINSTALL
# ======================================================================================
	SpairaruCtlr_Pkg__uistl() {


		# [ result ]
		local _rslt ;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%s : Uninstallation" \
			"$S_TTL" \
		;


		# MAIN PROCESS : REMOVE ALIASES --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltBlkTtl \
			"Removing Aliases..." \
		;


		SpairaruCtlr_Pkg____unistlAkax ;

		_rslt=$? ;


		# MAIN PROCESS : REMOVE FILES --------

		if [[ $_rslt == $tru ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltBlkTtl \
				"Removing Files..." \
			;


			SpairaruCtlr_Pkg____unistlFlx ;

			_rslt=$? ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "uistl" \
			--stt $_rslt \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# UPGRADE
# ======================================================================================
	SpairaruCtlr_Pkg__upg() {


		# [ result ]
		local _rslt=$tru ;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%s : Upgradation" \
			"$S_TTL" \
		;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltBlkTtl \
			"Checking Update..." \
		;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "upg" \
			--stt $_rslt \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE PRIVATE FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# __INSTALL FILES
# ======================================================================================
	SpairaruCtlr_Pkg____istlFlx() {


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh 👈
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		! s \
			fl \
				ex \
					"$S_APP_EXC_FL" \
		&& return $fls \
		;


		chmod \
			+x \
			"$S_APP_EXC_FL" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.ini 👈
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.ini
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.ini
		# 	      └─ 🖺 *.ini
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		# - global configuration folder path is set
		[[ -f "$S_D_CNF_FL" ]] \
		&& s \
			fl \
				mk \
					"$S_D_CNF_FL" \
				\
				--vbo_ttl "${ANSI_F_PR}`s_gtPrflTtl "dflt"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.ini
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.ini 👈
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.ini
		# 	      └─ 🖺 *.ini
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		# - local configuration folder path is set
		[[ -f "$S_G_CNF_FL" ]] \
		&& s \
			fldr \
				mk \
					"$S_G_CNF_FL" \
				\
				--vbo_ttl "${ANSI_F_PR}`s_gtPrflTtl "glo"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
		;


		return $tru ;


	} ;



# ======================================================================================
# __INSTALL ALIASES
# ======================================================================================
	SpairaruCtlr_Pkg____istlAkax() {


		# BASH --------

		# [ bash_global_profile_file_path ]
		local _bash_glo_prfl_fl_pf="` \
			s \
				bash \
					prfl \
						pf \
					--glo \
		`" ;

		# [ bash_global_profile_document_linebreak ]
		local _bash_glo_prfl_doc_lnbrk="` \
			s_gtDocLnBrkChr \
				"$_bash_glo_prfl_fl_pf" \
		`" ;


		# 1 			: utility group
		# 2 			: action
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				optmz \
			"$@" \
		;


		# i ) CLI : s

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# -- document option --
		# aft 			: wrtite in after this
		# -- profile option --
		# pf 			: profile path
		# -- environment option --
		# vbo 			: verbose
		! s \
			bash \
				prfl \
					aka \
						"$S_S_CLI" \
						"$S_APP_EXC_FL" \
						--aft 'shopt -s expand_aliases.*'"$_bash_glo_prfl_doc_lnbrk" \
				\
				--pf "$_bash_glo_prfl_fl_pf" \
				\
			"$@" \
		&& return $fls \
		;


		# iii ) CLI : spairaru

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# -- document option --
		# aft 			: wrtite in after this
		# -- profile option --
		# pf 			: profile path
		# -- environment option --
		# vbo 			: verbose
		! s \
			bash \
				prfl \
					aka \
						"$S_L_CLI" \
						"$S_APP_EXC_FL" \
						--aft 'shopt -s expand_aliases.*'"$_bash_glo_prfl_doc_lnbrk" \
				\
				--pf "$_bash_glo_prfl_fl_pf" \
				\
			"$@" \
		&& return $fls \
		;


		# iii ) CLI : __

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# -- document option --
		# aft 			: wrtite in after this
		# -- profile option --
		# pf 			: profile path
		# -- environment option --
		# vbo 			: verbose
		! s \
			bash \
				prfl \
					aka \
						"__" \
						"$S_APP_FLDR"'/__.sh' \
					--aft 'alias '"$S_S_CLI"'=.*'"$_bash_glo_prfl_doc_lnbrk" \
				\
				--pf "$_bash_glo_prfl_fl_pf" \
				\
			"$@" \
		&& return $fls \
		;


		# CURRENT SHELL --------

		# [ shell_langurage ]
		local _sh_lng="`basename $SHELL`" ;


		# - shell is not bash
		if [[ "$_sh_lng" != "bash" ]] ;
		then


			# A ) SHELL SUPPORTED

			# - shell is supported
			if [[ $_sh_lng =~ ^(csh|fish|tcsh|zsh)$ ]] ;
			then


				# [ shell_global_profile_file_path ]
				local _sh_glo_prfl_fl_pf="` \
					s \
						$_sh_lng \
							prfl \
								pf \
							--glo \
				`" ;

				# [ shell_global_profile_document_linebreak ]
				local _sh_glo_prfl_doc_lnbrk="` \
					s_gtDocLnBrkChr \
						"$_sh_glo_prfl_fl_pf" \
				`" ;


				# 1 			: utility group
				# 2 			: action
				# 3 			: shell type
				# -- environment option --
				# vbo 			: verbose
				s \
					$_sh_lng \
						abj2 \
							bash \
					"$@" \
				;


				# i ) CLI : m

				# 1 			: utility group
				# 2 			: method
				# 3 			: action
				# 4 			: alias key
				# 5 			: alias value
				# -- document option --
				# aft 			: wrtite in after this
				# -- profile option --
				# pf 			: profile path
				# -- environment option --
				# vbo 			: verbose
				s \
					$_sh_lng \
						prfl \
							aka \
								"$S_S_CLI" \
								'bash \+x '"$S_APP_EXC_FL" \
								--aft 'export BASH_ENV=.*'"$_sh_glo_prfl_doc_lnbrk" \
						\
						--pf "$_sh_glo_prfl_fl_pf" \
						\
					"$@" \
				;


				# ii ) CLI : spairaru

				# 1 			: utility group
				# 2 			: method
				# 3 			: action
				# 4 			: alias key
				# 5 			: alias value
				# -- document option --
				# aft 			: wrtite in after this
				# -- profile option --
				# pf 			: profile path
				# -- environment option --
				# vbo 			: verbose
				s \
					$_sh_lng \
						prfl \
							aka \
								"spairaru" \
								'bash \+x '"$S_APP_EXC_FL" \
								--aft 'export BASH_ENV=.*'"$_sh_glo_prfl_doc_lnbrk" \
						\
						--pf "$_sh_glo_prfl_fl_pf" \
						\
					"$@" \
				;


				# iii ) CLI : __

				# 1 			: utility group
				# 2 			: method
				# 3 			: action
				# 4 			: alias key
				# 5 			: alias value
				# -- document option --
				# aft 			: wrtite in after this
				# -- profile option --
				# pf 			: profile path
				# -- environment option --
				# vbo 			: verbose
				s \
					$_sh_lng \
						prfl \
							aka \
								"__" \
								'bash \+x '"$S_APP_FLDR"'/__.sh' \
								--aft 'alias '"$S_S_CLI"'=.*'"$_sh_glo_prfl_doc_lnbrk" \
						\
						--pf "$_sh_glo_prfl_fl_pf" \
						\
					"$@" \
				;


			# B ) SHELL NOT SUPPORTED

			else 

				# 1 			: message
				# 2+ 			: fragments
				# wc 			: with condition
				s_ivkPptTpl_DfltAcpt \
					"%s does not support for current shell type: %s yet." \
					"`__ "${ANSI_F_GN}${S_NM}${_ANSI}"`" \
					"`__ "${ANSI_F_BL}${_sh_lng}${_ANSI}"`" \
					--wc \
				;


			fi ;


		fi ;


		return $tru ;


	} ;



# ======================================================================================
# __UNINSTALL FILES
# ======================================================================================
	SpairaruCtlr_Pkg____unistlFlx() {


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	👟
		# 	└─ 🖿 var
		# 	   └─ 🖿 log  👈
		# 	      └─ 🖺 spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		s \
			fldr \
				rm \
					"${S_LOG_FLDR}" \
					--vbo_ttl "${ANSI_F_BL}`__ "Log"`${_ANSI}" \
			--nfc \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	👟
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 Spairaru.Bash 👈

		s \
			fldr \
				rm \
					"${S_TMP_FLDR}" \
					--vbo_ttl "${ANSI_F_BL}`__ "Temporary"`${_ANSI}" \
			--nfc \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 Spairaru.Bash 👈
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	👟
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		s \
			fldr \
				rm \
					"${S_D_CNF_FLDR}" \
					--vbo_ttl "${ANSI_F_PR}`__ "global"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
			--nfc \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME 
		# 	│  └─ 🖿 .s.bash 👈
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	👟
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		s \
			fldr \
				rm \
					"${S_G_CNF_FLDR}" \
					--vbo_ttl "${ANSI_F_PR}`__ "local"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
			--nfc \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 Spairaru.Bash 👈
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME 
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	👟
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		s \
			fldr \
				rm \
					"${S_APP_FLDR}" \
					--vbo_ttl "${ANSI_F_BL}`__ "Applicaiton"`${_ANSI}" \
			--nfc \
		;


		return $tru ;


	} ;



# ======================================================================================
# __UNINSTALL ALIASES
# ======================================================================================
	SpairaruCtlr_Pkg____unistlAkax() {


		# BASH --------

		# i ) CLI : s

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# dl 			: perform delete action
		# -- profile option --
		# glo 			: global profile
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"$S_S_CLI" \
						--dl \
				\
				--glo \
				\
			"$@" \
		;


		# i1 ) CLI : spairaru

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# dl 			: perform delete action
		# -- profile option --
		# glo 			: global profile
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"$S_L_CLI" \
						--dl \
				\
				--glo \
				\
			"$@" \
		;


		# iii ) CLI : __

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# dl 			: perform delete action
		# -- profile option --
		# glo 			: global profile
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"__" \
						--dl \
				\
				--glo \
				\
			"$@" \
		;


		# B ) CURRENT SHELL --------

		# [ shell_langurage ]
		local _sh_lng="`basename $SHELL`" ;


		# - shell is not bash
		# - shell is supported
		if [[ \
			"$_sh_lng" != "bash" \
			&& $_sh_lng =~ ^(csh|fish|tcsh|zsh)$ \
		]] ;
		then


			# i ) CLI : s

			# 1 			: utility group
			# 2 			: method
			# 3 			: action
			# 4 			: alias key
			# 5 			: alias value
			# dl 			: perform delete action
			# -- profile option --
			# glo 			: global profile
			# -- environment option --
			# vbo 			: verbose
			s \
				$_sh_lng \
					prfl \
						aka \
							"$S_S_CLI" \
							--dl \
					\
					--glo \
					\
				"$@" \
			;


			# ii ) CLI : spairaru

			# 1 			: utility group
			# 2 			: method
			# 3 			: action
			# 4 			: alias key
			# 5 			: alias value
			# dl 			: perform delete action
			# -- profile option --
			# glo 			: global profile
			# -- environment option --
			# vbo 			: verbose
			s \
				$_sh_lng \
					prfl \
						aka \
							"spairaru" \
							--dl \
					\
					--glo \
				\
				"$@" \
			;


			# iii ) CLI : __

			# 1 			: utility group
			# 2 			: method
			# 3 			: action
			# 4 			: alias key
			# 5 			: alias value
			# dl 			: perform delete action
			# -- profile option --
			# glo 			: global profile
			# -- environment option --
			# vbo 			: verbose
			s \
				$_sh_lng \
					prfl \
						aka \
							"__" \
							--dl \
					\
					--glo \
				\
				"$@" \
			;


		fi ;


		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	SpairaruCtlr_Pkg__isIstld() {


		# a 					: 
		# alias __cli__=\' 		: match anything after thsi
		# \K 					: capture from here
		# .* 					: capture anything
		# (?=\') 				: capture until next '

		# [ command_path ]
		local _cmd_pf="` \
			alias \
			| grep \
				-Po \
				"alias ${S_S_CLI}=\'\K.*(?=\')" \
		`" ;


		[[ -z "$_cmd_pf" ]] \
		&& return $fls \
		;


		# 1 		: utility group
		# 2 		: action
		# 3 		: path
		fl \
			ex \
				"$_cmd_pf" \
		;


		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================

	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : POSITIONED --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			istl | install ) _mtd=SpairaruCtlr_Pkg__istl ;;

			uistl | uninstall ) _mtd=SpairaruCtlr_Pkg__uistl ;;

			upg | upgrade ) _mtd=SpairaruCtlr_Pkg__upg ;;


		esac ;


		# - method is not empty
		if [[ "$_mtd" ]] ;
		then


			shift 1 \
			&& "$_mtd" \
				"$@" \
			;


			return $? ;


		fi ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


 } ;
