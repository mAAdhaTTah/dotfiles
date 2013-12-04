# $PATH Changes

export PATH="/usr/local/bin:$(brew --prefix josegonzalez/php/php55)/bin:$PATH"

# Aliases

alias edit_apache='sudo nano /etc/apache2/httpd.conf'
alias edit_vhosts='sudo nano /etc/apache2/extra/httpd-vhosts.conf'
alias edit_phpini='sudo nano /usr/local/etc/php/5.5/php.ini'

# Homebrew Cask Update

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
