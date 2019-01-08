#
# Node.js
#
# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
# Link: https://nodejs.org/

function __bt_prompt_nodejs -d "Display the local node version"
	
	[ $BULLETTRAIN_NODEJS_SHOW = false ]; and return


    set -g _nodejs_prompt
	if type -q nvm
		# Only recheck the node version if the nvm bin has changed
		if test "$NVM_BIN" != "$sf_last_nvm_bin" -o -z "$_nodejs_prompt"
			set -g _nodejs_prompt (nvm current 2>/dev/null)
			set -g sf_last_nvm_bin $NVM_BIN
		end
	else if type -q nodenv
		set -g _nodejs_prompt (nodenv version-name 2>/dev/null)
	else if type -q node
		set -g _nodejs_prompt (node -v 2>/dev/null)
	else
		return
	end
	

	# Don't echo section if the system verison of node is being used
	[ "$_nodejs_prompt" = "system" -o "$_nodejs_prompt" = "node" ]; and return

	# Don't echo section if the node version matches the default version
	[ "$_nodejs_prompt" = "$BULLETTRAIN_NODEJS_DEFAULT" ]; and return
	
    test "$_nodejs_prompt";
    and set _nodejs_prompt $BULLETTRAIN_NODEJS_PREFIX $_nodejs_prompt;
      and __bt_prompt_segment $BULLETTRAIN_NODEJS_BG $BULLETTRAIN_NODEJS_FG "$_nodejs_prompt"

end