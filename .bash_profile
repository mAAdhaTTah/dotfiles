# $PATH Changes

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Aliases

alias edit_apache='sudo nano /etc/apache2/httpd.conf'
alias edit_hosts='sudo nano /etc/hosts'
alias edit_vhosts='sudo nano /etc/apache2/extra/httpd-vhosts.conf'
alias edit_phpini='sudo nano /usr/local/etc/php/5.5/php.ini'
alias pgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'

# Homebrew Cask Update

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# New Default Editor

export EDITOR=nano

# Function to start and stop the web server

webdev() {
	sudo apachectl $1
	mysql.server $1
}
