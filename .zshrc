# iTerm2
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"

# Prompt (Starship)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Zinit setup
source "$(brew --prefix)/opt/zinit/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Completion styling
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:(cd|z|eza|code|subl|bat):*' \
  fzf-preview 'eza --icons --color=always $realpath'
zstyle ':fzf-tab:complete:*:*' \
  fzf-preview '[[ -d $realpath ]] && eza --icons --color=always $realpath || bat --color=always $realpath'
zstyle ':omz:plugins:eza' 'icons' yes

# Plugins & completions (reordered)
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# OMZ snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found
zinit snippet OMZP::eza
zinit snippet OMZP::brew
zinit snippet OMZP::python

# Disable Homebrew env hints
export HOMEBREW_NO_ENV_HINTS=1

# Zoxide
eval "$(zoxide init zsh)"

# Force completion system rebuild
autoload -Uz compinit
compinit

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window up:3:hidden:wrap --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"

# Conda
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [[ $? -eq 0 ]]; then
    eval "$__conda_setup"
elif [[ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]]; then
    source "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
else
    export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
fi
unset __conda_setup

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups hist_reduce_blanks hist_no_store

# Aliases
alias zshconfig="code ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ..="z .."
alias ...="z ..."
alias c="clear"
alias pn=pnpm

export FZF_DEFAULT_OPTS='
  --height 40%
  --reverse
  --preview="[[ -d {} ]] && eza --icons --color=always {} || bat --style=numbers --color=always {}"
  --preview-window=right:60%
'

# Postgresql
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

# Docker CLI
fpath=(/Users/vanstrouble/.docker/completions $fpath)

# Mole shell completion
if output="$(mole completion zsh 2>/dev/null)"; then eval "$output"; fi

# Yazi shell wrapper
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
