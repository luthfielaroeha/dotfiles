# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

function dev() {
  tmuxinator "$@"
}

# Copy file content to clipboard
function copy_content {
  cat $1 | pbcopy
}
