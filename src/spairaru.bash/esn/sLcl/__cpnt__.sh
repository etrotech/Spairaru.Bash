
#!/usr/bin/env bash
# ######################################################################################
# CONPONENT HOOK
# ######################################################################################
# --------------------------------------------------------------------------------------
# SPAIRARU
# --------------------------------------------------------------------------------------
s \
	cpnt \
		"LclCtlr" \
		"lcl" \
		"locale" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
;
