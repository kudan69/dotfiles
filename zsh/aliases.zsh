alias mv='mv -i'
alias vimm='mvim -v'
alias gvim='mvim -p'
alias be="bundle exec"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
# usage:  > long_command & badge
alias badge="tput bel"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"


# cas
cas_url='http://localhost:8080/cas-server-webapp-3.3.5/login'
alias casup="$PROJECTS/cas/tomcat/bin/startup.sh & open $cas_url"
alias casdown="$PROJECTS/cas/tomcat/bin/shutdown.sh"

# ec2
alias instances="ec2-describe-instances"

# nginx
alias nginx-up="sudo nginx -c /usr/local/etc/nginx/nginx.conf"
alias nginx-down="sudo nginx -s stop"

#postgresql
alias pg-up='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-down='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# redis
alias redis-up="redis-server $ZSH/redis/redis.conf > /dev/null &"
alias redis-down='killall redis-server'

# ruby
alias cpwd="pwd | ruby -pe'\$_.chomp!' | pbcopy"
alias rshare="ruby -rubygems -e \"['thin', 'rack', 'socket'].each {|file| require file };"\
" Thin::Server.start(IPSocket.getaddress(Socket.gethostname), 7777) {"\
" use Rack::CommonLogger; run Rack::Directory.new(Dir.pwd) }\""
alias duo='du -sh $(du -s * | sort -k1n | ruby -nae '\''puts '\$'F[1..-1].join("?")'\'')'



# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lFAh --color"
  alias ll="gls -lF --color"
  alias la='gls -AF --color'
fi


# Remove the hosts that I don't want to keep around- in this case, only
# keep the first host. Like a boss.
alias hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"

# Pipe my public key to my clipboard. Fuck you, pay me.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# moom settings
alias moom-in="cp ~/Dropbox/Apps/Moom/com.manytricks.Moom.plist  ~/Library/Preferences"
alias moom-out="cp ~/Library/Preferences/com.manytricks.Moom.plist ~/Dropbox/Apps/Moom;cp ~/Library/Preferences/com.manytricks.Moom.plist ~/.dotfiles/osx/"
alias moom-init="cp ~/.dotfiles/osx/com.manytricks.Moom.plist ~/Library/Preferences/"
