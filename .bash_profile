# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

bind -f $HOME/.inputrc
source $HOME/.prompt

EDITOR="nano -w"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

if [ -d $HOME/.composer/vendor/bin ]; then
  PATH="$HOME/.composer/vendor/bin:$PATH"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias p="cd $HOME/Projekte"

function o() {
	if [ $# -eq 0 ]; then
		open .
	else
		open "$@"
	fi
}

function tw() {
	open -a TextWrangler $*
}
