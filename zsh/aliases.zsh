alias cls='clear'
alias mkdir='mkdir -pv'
alias ports='netstat -tulanp'

# Vim alias
alias vim='nvim'

# Find running process
alias psg='ps aux | grep -i'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Reload ZSH configuration
alias reload='source ~/.zshrc'

# Alias for Language

# CPP
crun () { make "$1" && ./"$1" }

cprepare() { touch "$1.cpp" && touch "$1.in" && touch "$1.expected" }
ctest() { make $1 && ./$1 < $1.in > $1.out && diff $1.expected $1.out }
