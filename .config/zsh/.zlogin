# load order 8 (login) after /etc/zlogin (none)

[[ -f /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh ]] && source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
[[ -f ${HOME}/.fzf.zsh ]] && source ${HOME}/.fzf.zsh

[[ ${commands[gh]} ]] && source <(gh completion -s zsh)
[[ ${commands[starship]} ]] && source <(starship init zsh)

for folder in secret include; do
  for filename in "${ZDOTDIR}/$folder"/*; do
    source "$filename"
  done
done

[[ ${commands[exa]} ]] && alias ll='exa --long --sort=modified --group-directories-first --time-style=long-iso --icons --grid --git'
[[ ${commands[exa]} ]] && alias lla='ll --all'
