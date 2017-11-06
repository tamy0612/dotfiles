setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt
unsetopt promptcr

local DEFAULT='%{[m%}'
local RED='%{[31m%}'
local GREEN='%{[32m%}'
local YELLOW='%{[33m%}'
local BLUE='%{[34m%}'
local MAGENTA='%{[35m%}'
local CYAN='%{[36m%}'
local WHITE='%{[37m%}'
local GRAY='%{[90m%}'

case "${TERM}" in
    dumb)
        PROMPT='%m:%c %n%(!.#.$) '
        ;;
    *)
        # Color configuration
        autoload -Uz colors && colors
        case "`tput colors`" in
            8)
                local prompt_success_color='%{${bg[green]}${fg_bold[white]}%}'
                local prompt_fail_color='%{${bg[red]}${fg_bold[white]}%}'
                local prompt_path_color='%{${GRAY}${fg[black]}%}'
                local prompt_date_color='%{${GRAY}%}'
                ;;
            256)
                local prompt_success_color='%{%K{28}%F{255}%}'
                local prompt_fail_color='%{${bg[red]}%F{255}%}'
                local prompt_path_color='%{%K{240}%F{255}%}'
                local prompt_vcs_color='%{%K{237}%F{255}%}'
                local prompt_date_color='%{%F{245}%}'
                ;;
            *)
                ;;
        esac
        # VCS info.
        # PROMPT
        ## Head
        local prompt_last_status="%(?.${prompt_success_color}.${prompt_fail_color}) %n@%M ${reset_color}"
        ## Path
        local prompt_path="${prompt_path_color} %~ ${reset_color}"
        ## VCS info.
        autoload -Uz vcs_info
        zstyle ':vcs_info:*' enable git hg svn
        [[ ${is-at-least 4.3.10} ]] && zstyle ':vcs_info:*' check-for-changes true
        zstyle ':vcs_info:*' stagedstr '%{${fg_bold[yellow]}%}!%{${reset_color}${prompt_vcs_color}%}'
        zstyle ':vcs_info:*' unstagedstr '%{${fg_bold[red]}%}+%{${reset_color}${prompt_vcs_color}%}'
        zstyle ':vcs_info:*' formats '%s:%u%c%b'
        zstyle ':vcs_info:*' actionformats '%s:%u%c%b | %a'
        update_prompt(){
            local prompt_vcs_info=""
            LANG=en_US.UTF-8 vcs_info
            if [ -z ${vcs_info_msg_0_} ]; then
                prompt_vcs_info="${prompt_vcs_color} [untracked] %{${reset_color}%}"
            else
                prompt_vcs_info="${prompt_vcs_color} ${vcs_info_msg_0_} %{${reset_color}%}"
            fi
            PROMPT="
${prompt_last_status}${prompt_path}${prompt_vcs_info}
%(!.#.>) %{%k%f%b%}"
        }
        add-zsh-hook precmd update_prompt
        # Others
        PROMPT2="|%(!.#.>) "
        RPROMPT="${prompt_date_color}[%D{%d/%m/%y %H:%M:%S}]%{${reset_color}%}"
        SPROMPT="${prompt_fail_color} correct: ${prompt_success_color} %R -> %r [nyae]? %{${reset_color}%} "
        ;;
esac
if [ -n "${SSH_CLIENT}${SSH_CONNECTION}" ]; then
    PROMPT=$CYAN"[ssh] "$PROMPT$DEFAULT
fi
