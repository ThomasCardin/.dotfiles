# .bashrc

# ALIAS
alias "vpn=/opt/cisco/anyconnect/bin/vpnui"
alias "discord=flatpak run com.discordapp.Discord"
alias "lock=i3lock -c 000000"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[1;37m\][\u@\h]\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\]\[\e[1;33m\]\$(parse_git_branch)\[\e[0m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


unset rc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tcardin/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/tcardin/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tcardin/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/tcardin/Downloads/google-cloud-sdk/completion.bash.inc'; fi
