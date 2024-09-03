#! /bin/bash
# Simple aliases
	alias adb-packages='adb shell "pm list packages"' # Easier access to listing packages installed on a device connected via ADB
	alias apt-search="dpkg-query -L"
#	alias composer="sudo -uapache composer"
	alias diff="git diff --no-index --color-words" # Use gits' diff feature on any files
#	alias git="hub"
	alias grep='grep --color=auto'
#	irccert='sudo su -l weechat -c "irccert $1"'
	alias ls='ls -F --group-directories-first --color=tty'
	alias ncdu='ncdu -x -e -r --exclude-kernfs --confirm-quit -2 --color off'
	alias rm='rm -i' # Make rm interactive by default
	alias sftp="sftp -o 'RemoteCommand none'" # Prevent execution of configured SSH RemoteCommand
	alias ssh='ssh -t' # Force allocation of a tty
	alias wanip4='curl -4 icanhazip.com'
	alias wanip6='curl -6 icanhazip.com'
#----

# Conditional Aliases
	# Replace cat with the superior bat
	if $(which batcat > /dev/null) ; then
		alias cat='batcat'
	fi

	# Enable `fuck` as an alias for `thefuck`
	if fuck > /dev/null 2>&1 ; then
		eval "$(thefuck --alias)"
	fi

	# If microk8s is installed, alias its kubectl to mkctl
#	if hash microk8s > /dev/null 2>&1 ; then
#		alias mkctl="microk8s kubectl"
#	fi

#----

# Complex aliases
	# occ command for managing owncloud
#	if [[ -e /var/www/html/owncloud/occ ]] ; then
#		alias occ="sudo -uapache /var/www/html/owncloud/occ"
#	fi
#--->

	# Set an alias for nano that is tailored to the capabilities of the installed version.
	# alias nano='nano--tabsize=4 --linenumbers --wordbounds --softwrap --constantshow'
	nanohelp=$(nano --help)
	nanolist=("--linenumbers" "--wordbounds" "--softwrap" "--constantshow")
	for i in "${nanolist[@]}" ; do
		if echo "$nanohelp" | grep --silent "\\$i" ; then
			nanoargs="${nanoargs} ${i}"
		fi
	done
	if echo "$nanohelp" | grep --silent "\--tabsize" ; then
		nanoargs="${nanoargs} --tabsize=4"
	fi
	# shellcheck disable=SC2139
	alias nano="nano ${nanoargs}"
#--->
