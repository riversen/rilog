# Create the log directory if it doesn't exist
if [[ ! -d ~/.zshlog ]]; then
  mkdir ~/.zshlog
fi

# Define the log file and timing file with date and time
LOGFILE=~/.zshlog/shelllog.$(date +'%Y-%m-%d-%H-%M-%S').log
TIMINGFILE=~/.zshlog/shelllog.$(date +'%Y-%m-%d-%H-%M-%S').timing

# Start logging with script command
if [[ -z "$SCRIPT_LOGGING" ]]; then
  export SCRIPT_LOGGING=1
  script -q -t 2> "$TIMINGFILE" "$LOGFILE"
  exit
fi

# Customize the prompt to include date and time
autoload -U colors && colors
setopt PROMPT_SUBST

PROMPT='%{$fg[cyan]%}$(date +'%Y-%m-%d-%H-%M-%S')%{$reset_color%} %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}%# '

# Save history to a file
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

