lint:
	@docker run -it --rm \
		-v "$(realpath ${PWD})":"${PWD}":ro \
		-w "$(realpath ${PWD})" \
		koalaman/shellcheck:stable \
			--shell=bash .bash_functions .bash_aliases
