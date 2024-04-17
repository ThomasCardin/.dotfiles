# .bashrc

# ALIAS
alias "vpn=/opt/cisco/anyconnect/bin/vpnui"
alias "lock=i3lock -c 000000 && xset dpms force off"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PS1="\[\033[1;37m\][\u@\h]\[\033[38;5;250m\] \w\[\033[1;38;5;33m\]\$(parse_git_branch)\[\033[0m\]\[\033[1m\] $ \[\033[0m\]"
export CLICOLOR=1
export LS_COLORS="di=01;34:ex=01;35:"  # Dossiers en bleu gras, fichiers exécutables en cyan gras

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
