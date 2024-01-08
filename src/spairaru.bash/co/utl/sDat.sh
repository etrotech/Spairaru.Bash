#!/usr/bin/env bash
# ######################################################################################
# DATA UTILITY
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ARRAY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# DELETE ARRAY INDEX
# ======================================================================================
s_dlArrIdx() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# ARGUMENT : POSITIONED --------

	# [ index ]
	local idx__="${_ax[0]}" ;


	# PRECHECK : KEY --------

	[[ -z "$idx__" ]] \
	&& return $fls \
	;


	# PRE PROCESS : REBUILD ARGUMENTS --------

	shift ;

	_ax=("$@") ;


	# MAIN PROCESS : EDIT --------

	# [ literal ]
	local -a _ltrl ;

	
	# [ indext ]
	for i in "${!_ax[@]}" ;
	do

		[[ $i -ne $idx__ ]] \
		&& _ltrl+=("'${_ax[$i]}'") \
		;

	done ;


	# POST PROCESS : OUT RESULT --------

	echo "(${_ltrl[@]})" ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# CONVERT ARRAY TO STIRNG
# ======================================================================================
s_cnvArr2Str() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# PRECHECK : KEYS --------

	[[ -z "${_ax[@]}" ]] \
	&& echo '()' \
	&& return $fls \
	;


	# POST PROCESS : OUTPUT RESULT --------

	echo "(" ;

	# [ index ]
	for i in "${!_ax[@]}" ; 
	do

		echo "${S_PPT_ITND}'${_ax[$i]}'" ;

	done ;

	echo ")" ;



	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DIECTIONARY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# CONVERT DIECTIONARY TO STIRNG
# ======================================================================================
s_cnvDic2Str() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENTS --------

	# [ dictionary_keys ]
	local -a dic_kyx__ ;

	# [ dictionary_values ]
	local -a dic_vlux__ ;

	# [ after_double_slash ]
	local _aftr_dbl_slh=$fls ;


	for (( i=0 ; i<${#_ax[@]} ; i++ )) ;
	do


		[[ "${_ax[$i]}" == -- ]] \
		&& _aftr_dbl_slh=$tru \
		&& continue \
		;


		[[ $_aftr_dbl_slh == $fls ]] \
		&& dic_kyx__+=("${_ax[$i]}") \
		;


		[[ $_aftr_dbl_slh == $tru ]] \
		&& dic_vlux__+=("${_ax[$i]}") \
		;


	done ;



	# PRECHECK : KEYS --------

	[[ -z "${dic_kyx__[@]}" ]] \
	&& echo '()' \
	&& return $fls \
	;


	# POST PROCESS : OUTPUT RESULT --------

	echo "(" ;

	# [ index ]
	for i in "${!dic_kyx__[@]}" ; 
	do

		echo "  [${dic_kyx__[$i]}]='${dic_vlux__[$i]}'" ;

	done ;

	echo ")" ;



	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
