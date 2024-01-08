
#!/usr/bin/env bash
# ######################################################################################
# CONPONENT HOOK
# ######################################################################################
# --------------------------------------------------------------------------------------
# SPAIRARU
# --------------------------------------------------------------------------------------
s \
	cpnt \
		"BashCtlr" \
		"bash" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
		--rpr doc \
		--rpr fl \
;

s \
	cpnt \
		"CshCtlr" \
		"csh" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
		--rpr doc \
		--rpr fl \
;

s \
	cpnt \
		"FishCtlr" \
		"fish" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
		--rpr doc \
		--rpr fl \
;

s \
	cpnt \
		"TcshCtlr" \
		"tcsh" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
		--rpr doc \
		--rpr fl \
;

s \
	cpnt \
		"ZshCtlr" \
		"zsh" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
		--rpr doc \
		--rpr fl \
;
