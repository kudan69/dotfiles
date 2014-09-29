alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias rt="ctags -R *"

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
alias l="ls -AFG"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ruby
alias cpwd="pwd | ruby -pe'\$_.chomp!' | pbcopy"
alias rshare="ruby -rubygems -e \"['thin', 'rack', 'socket'].each {|file| require file };"\
" Thin::Server.start(IPSocket.getaddress(Socket.gethostname), 7777) {"\
" use Rack::CommonLogger; run Rack::Directory.new(Dir.pwd) }\""
alias duo='du -sh $(du -s * | sort -k1n | ruby -nae '\''puts '\$'F[1..-1].join("?")'\'')'

# My personal ones
alias zshrc="vi ~/.zshrc"
alias la='ls -al'
alias vimconfig='vi ~/.vim/common_config/key_mappings.vim'
alias personal='cd ~/Dropbox/home_projects/'

