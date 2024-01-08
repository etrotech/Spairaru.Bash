#!/usr/bin/env bash
# ######################################################################################
# NGNIX CONTROLLER UTILITY GROUP
# ######################################################################################
NgxCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE PRIVATE PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ identity ]
	local __id__="ngnix" ;

	# [ command_line ]
	local __cli__="ngnix" ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	NgxCtlr__istl() {


		# POST PROCESSES --------

		spairaru \
			os \
				istl \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UNINSTALL
# ======================================================================================
	NgxCtlr__uistl() {


		# POST PROCESSES --------

		spairaru \
			os \
				uistl \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UPGRADE
# ======================================================================================
	NgxCtlr__upg() {


		# POST PROCESSES --------

		spairaru \
			os \
				upg \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATUS STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	NgxCtlr__isIstld() {


		# POST PROCESSES --------

		spairaru \
			os \
				isIstld \
					$__id__ \
					--cli $__cli__ \
		;


		# POST PROCESS : REPORT STATUS --------

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
		spairaru \
			cbl \
				pax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# PAKAGE CORE

		istl | install ) _mtd=NgxCtlr__istl ;;

		uistl | uninstall ) _mtd=NgxCtlr__uistl ;;

		upg | upgrade ) _mtd=NgxCtlr__upg ;;


		# PAKAGE STATEFUL

		isIstld | isIsntalled ) _mtd=NgxCtlr__isIstld ;;


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


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;