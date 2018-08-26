# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%B%F{yellow}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%fo %f'
else # root
  PR_USER='%B%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%B%F{blue}%M%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{green}@${PR_HOST}"
local current_dir="%B%F{cyan}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="╭─${user_host} ${current_dir} ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{green}] %f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{magenta}+"

}
