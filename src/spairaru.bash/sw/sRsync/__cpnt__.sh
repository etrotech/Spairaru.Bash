
#!/usr/bin/env bash
# ######################################################################################
# CONPONENT HOOK
# ######################################################################################
# --------------------------------------------------------------------------------------
# SPAIRARU
# --------------------------------------------------------------------------------------
s \
	cpnt \
		"RmtSyncCtlr" \
		"rsync" \
		"${BASH_SOURCE[0]%/*}"/__ldr__.sh \
		--rpr doc \
		--rpr ppt \
		--rpr fl \
;
