#!/usr/bin/env bash
# ######################################################################################
# DOCUMENT UTILITY
# ######################################################################################
# ======================================================================================
# APPLY DOCUMENT ACTIONS
# ======================================================================================
s_aplyDocAtnx() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# ARGUMENT : POSITIONED --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ file_absolute_path ]
	local fl_abs_pf__="${_pax[0]}" ;

	# [ action ]
	local atn__="${_pax[1]}" ;


	# MAIN PROCESS : LANEBEAK CHARACTOR --------

	# [ linebreak ]
	local lnbrk="` \
		s_gtDocLnBrkChr \
			"$fl_abs_pf__" \
	`" ;


	# MAIN PROCESS : REBUILD INPUTS --------

	local -a _ax=` \
		s_dlArrIdx \
			1 \
			"${_ax[@]}" \
	` ;

	local -a _pax=` \
		s_dlArrIdx \
			1 \
			"${_pax[@]}" \
	` ;


	# MAIN PROCESS : INSERT LAST LANEBREAK --------

	# [ last_lane ]
	local _lst_ln="${#_pax[@]}" ;


	(( _lst_ln -- )) ;


	# ▧ find 
	# $ 					: very end
	# ▨ replace
	# & 					: at the end
	# \n 					: append linebreak
	_ax[$_lst_ln]="`
		echo "${_ax[$_lst_ln]}" \
		| sed \
			-r \
			's/$/&'"${lnbrk//\\\\/\\\\\\\\}"'/g' \
	`" ;


	# MAIN PROCESS : EDIT DOCUMENT --------

	# A ) Add Action

	if [[ $atn__ == "ad" ]] ;
	then

		# i ) Relocation Rule Exists

		# 1 		: action
		# 2 		: file absolute path
		# 3... 		: contents
		if \
			s \
				doc \
					hs \
						"${_pax[@]}" \
		;
		then

			_rslt=2 ;


		# ii ) Relocation Rule not Exists
		else

			# 1 	: action
			# 2 	: content
			# 3 	: file absolute path
			# 4... 	: contents
			s \
				doc \
					wrt \
						"${_ax[@]}" \
			;

			_rslt=$? ;


		fi ;


	# B ) Remove Action

	elif [[ $atn__ == "rm" ]] ;
	then

		# i ) Relocation Rule Exists

		# 1 		: action
		# 2 		: file absolute path
		# 3... 		: contents
		if \
			s \
				doc \
					hs \
						"${_pax[@]}" \
		;
		then

			# 1 		: action
			# 2 		: file absolute path
			# 3... 		: contents
			s \
				doc \
					ers \
						"${_ax[@]}" \
			;
				
			_rslt=$? ;


		# ii ) Relocation Rule not Exists
		else

			_rslt=2 ;


		fi ;


	# B ) Query Action

	else

		# ▧ find 
		# $ 					: very end
		# ▨ replace
		# & 					: at the end
		# \n 					: append linebreak
		_pax[$_lst_ln]="`
			echo "${_pax[$_lst_ln]}" \
			| sed \
				-r \
				-e \
				's/$/&\\\n/g' \
		`" ;


		# [ index ]
		for (( i=1 ; i < ${#_pax[@]} ; i ++ )) ;
		do

			echo "${_pax[$i]}" ;

		done ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# GET DOCUMENT LANEBREAK CHARACTOR
# ======================================================================================
s_gtDocLnBrkChr() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : POSITIONED --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ file_path ]
	local fl_pf__="${_pax[0]}" ;


	# PRECHECK : FILE ARGUMENT --------

	[[ -z "$fl_pf__" ]] \
	&& echo "$S_DOC_DFLT_LNBRK" \
	&& return $fls \
	;


	# PRECHECK : FILE EXISTENCE --------

	[[ ! -f "$fl_pf__" ]] \
	&& echo "$S_DOC_DFLT_LNBRK" \
	&& return $fls \
	;


	# MAIN PROCESS : MATCH FORMAT --------
	
	[[ \
		"` \
		cat \
			-A \
				"$fl_pf__" \
		`" \
		=~ "^M" \
	]] \
	&& echo '\r\n' \
	|| echo '\n' \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# GET DOCUMENT OPTIONS
# ======================================================================================
s_gtDocOptx() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# MAIN PROCESS : INSERT LAST LANEBREAK --------

	# [ options ]
	local -a _optx ;


	# [ argument ]
	for a in "${_ax[@]}" ;
	do


		# argument is double dash
		[[ "$_a" =~ --$ ]] \
		&& break \
		;


		# - options is not empty
		# - start with dash
		[[ \
			-n "$_optx" \
			|| "$a" =~ ^-
		]] \
		&& _optx+=("'$a'") \
		;


	done ;


	# POST PROCESS : OUT RESULT --------

	echo "(${_optx[@]})" ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
