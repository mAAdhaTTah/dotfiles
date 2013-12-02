# $PATH Changes

export PATH=/usr/local/bin:$PATH
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"

# Aliases

alias edit_apache='sudo nano /etc/apache2/httpd.conf'
alias edit_vhosts='sudo nano /etc/apache2/extra/httpd-vhosts.conf'
alias edit_php53ini='sudo nano /usr/local/etc/php/5.3/php.ini'
alias edit_php54ini='sudo nano /usr/local/etc/php/5.4/php.ini'
alias edit_php55ini='sudo nano /usr/local/etc/php/5.5/php.ini'

# Homebrew Cask Update

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
