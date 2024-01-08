#!/usr/bin/env bash
# ######################################################################################
# COMPONENT
# ######################################################################################

# [ arguments ]
local -a _ax=("$@") ;


# --------------------------------------------------------------------------------------
# ARGUMENT : POSITIONED
# --------------------------------------------------------------------------------------

# [ positoined_arguments ]
local -a _pax=` \
	s_gtCblPax \
` ;


# [ method ]
local Ctlr__="${_pax[0]}" ;

# [ aliases ]
local -a akax__=("${_pax[@]:1:${#_pax[@]}-2}") ;

# [ controller ]
local pf__="${_pax[@]: -1}" ;



# --------------------------------------------------------------------------------------
# ARGUMENT : NAMED
# --------------------------------------------------------------------------------------

# [ named_arguments ]
local -A _nax=` \
	s_gtCblNax \
		--rpr "require" \
		--rpr-nov 1 \
		--rpr-xasgmt \

` ;


# [ requirements ]
local -a rprmtx="${_nax[rpr]}" ;



# --------------------------------------------------------------------------------------
# PRECHECKS
# --------------------------------------------------------------------------------------

[[ ${#_pax[@]} -lt 2 ]] \
&& return $fls \
;



# --------------------------------------------------------------------------------------
# MAIN PROCESSES
# --------------------------------------------------------------------------------------

# ALIASES --------
# ↑ each element contains aliases in format :
#	[controller_name]=controller_name|alias_name...

__s_cpnt_akax__[$Ctlr__]="$Ctlr__" ;


for (( i=0 ; i<${#akax__[@]} ; i++ )) ;
do

	__s_cpnt_akax__[$Ctlr__]+="|${akax__[$i]}" ;

done ;


# LOADER --------
# ↑ each element contains in format :
# 	[controller_name]=script_path

__s_cpnt_ldr__[$Ctlr__]=$pf__ ;



# STATUS --------
# ↑ each element contains in format :
# 	[script_path]=(0|1)

[[ -z "${__s_cpnt_ldd__[$pf__]}" ]] \
&& __s_cpnt_ldd__[$pf__]=$fls \
;


# REPQUIREMENTS --------
# ↑ each element contains requirements in format :
# 	[controller_name]=(controller_name|alias_name)...

for (( i=0 ; i<${#rprmtx[@]} ; i++ )) ;
do

	[[ $i == 0 ]] \
	&& __s_cpnt_rprmtx__[$Ctlr__]="${rprmtx[$i]}" \
	|| __s_cpnt_rprmtx__[$Ctlr__]+=" ${rprmtx[$i]}" \
	;

done ;



# --------------------------------------------------------------------------------------
# POST TASK : REPORT STATUS
# --------------------------------------------------------------------------------------
return $tru ;
