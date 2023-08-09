# load order 2 after /etc/zshenv and before /etc/zprofile

export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR=${HOME}/.config/zsh

# /etc/zshenv → ~/.zshenv → /etc/zprofile →.zprofile → /etc/zshrc →~/.zshrc → /etc/zlogin →~/.zlogin →~/.zlogout → /etc/zlogout
#
# 1. /etc/zshenv: global environment variables
# 2. ~/.zshenv: user environment variables
# 3. /etc/zprofile: global environment variables that are specific to login shells
# 4. ~/.zprofile: user environment variables that are specific to login shells
# 5. /etc/zshrc: set up aliases, functions, key bindings, and other shell options
# 6. ~/.zshrc: todo
# 7. /etc/zlogin: todo
# 8. ~/.zlogin: todo
# 9. ~/.zlogout: todo
# 10. /etc/zlogout: todo

# if it is needed by a command run non-interactively: .zshenv
# if it should be updated on each new shell: .zshenv
# if it runs a command which may take some time to complete: .zprofile
# if it is related to interactive usage: .zshrc
# if it is a command to be run when the shell is fully setup: .zlogin
# if it releases a resource acquired at login: .zlogout
