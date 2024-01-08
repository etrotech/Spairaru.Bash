#!/usr/bin/env bash
# ######################################################################################
# VERBOSE UTILITY
# ######################################################################################
# ======================================================================================
# INVOKER PROMPT TEMPLATE - ABJUSTMENT TO
# ======================================================================================
s_ivkPptTpl_ShAbj2() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--sh_cat "shell" \
			--sh-nov 1 \
			\
			--to "to" \
			--to-nov 1 \
	` ;


	# [ status ]
	local stt="${_nax[stt]}" ;

	# [ shell ]
	local sh="${_nax[sh]}" ;

	# [ to ]
	local to="${_nax[to]}" ;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then

		s_ivkPptTpl_DfltAcpt \
			"%s shell is abjusted to %s shell" \
			"${ANSI_F_OR}${sh}${_ANSI}" \
			"${ANSI_F_OR}${to}${_ANSI}" \
		;


	# MAIN PROCESS : STATUS 1 --------

	else

		s_ivkPptTpl_DfltRej \
			"%s shell could not abjust to %s shell" \
			"${ANSI_F_OR}${sh}${_ANSI}" \
			"${ANSI_F_OR}${to}${_ANSI}" \
		;


	fi ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - ALIAS
# ======================================================================================
s_ivkPptTpl_ShAka() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--sh_cat "shell" \
			--sh-nov 1 \
			\
			--aka "alias" \
			--aka-nov 1 \
	` ;


	# [ status ]
	local stt="${_nax[stt]}" ;

	# [ shell ]
	local sh="${_nax[sh]}" ;

	# [ alias ]
	local aka="${_nax[aka]}" ;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then

		s_ivkPptTpl_DfltAcpt \
			"%s shell has command alias %s" \
			"${ANSI_F_OR}${sh}${_ANSI}" \
			"${ANSI_F_GN}${aka}${_ANSI}" \
		;


	# MAIN PROCESS : STATUS 1 --------

	else

		s_ivkPptTpl_DfltRej \
			"%s shell has not command alias %s" \
			"${ANSI_F_OR}${sh}${_ANSI}" \
			"${ANSI_F_GN}${aka}${_ANSI}" \
		;


	fi ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - COMMAND LANE
# ======================================================================================
s_ivkPptTpl_ShCli() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : NAMED --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--sh_cat "shell" \
			--sh-nov 1 \
			\
			--cmd "command" \
			--cmd-nov 1 \
	` ;


	# [ status ]
	local stt="${_nax[stt]}" ;

	# [ shell ]
	local sh="${_nax[sh]}" ;

	# [ command ]
	local cmd="${_nax[cmd]}" ;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then

		s_ivkPptTpl_DfltAcpt \
			"%s shell has command %s" \
			"${ANSI_F_OR}${sh}${_ANSI}" \
			"${ANSI_F_GN}${cmd}${_ANSI}" \
		;


	# MAIN PROCESS : STATUS 1 --------

	else

		s_ivkPptTpl_DfltRej \
			"%s shell has not command %s" \
			"${ANSI_F_OR}${sh}${_ANSI}" \
			"${ANSI_F_GN}${cmd}${_ANSI}" \
		;


	fi ;


} ;
