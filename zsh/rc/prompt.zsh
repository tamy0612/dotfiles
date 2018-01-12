setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt
unsetopt promptcr

case "${TERM}" in
    dumb)
        PROMPT='%~ %(!.#.>) '
        ;;
    *)
        # Color configuration
        autoload -Uz colors && colors
        local reset_style=${reset_color}'%{[0m%}'
        case "`tput colors`" in
            8)
                local prompt_success_color='%{${bg[green]}${fg_bold[white]}%}'
                local prompt_fail_color='%{${bg[red]}${fg_bold[white]}%}'
                local prompt_path_color='%{${GRAY}${fg[black]}%}'
                local prompt_date_color='%{${GRAY}%}'
                local prompt_correct_color='%{${fg_bold[red]}%}'
                ;;
            256)
                local ssh_style='%{[1;38;5;45m%}'
                local status_style='%(?.[1;38;5;82m.[1;38;5;9m)%}'
                local path_style='%{[1;38;5;39m%}'
                local track_style='%{[1;38;5;245m%}'
                local track_stagestr_style='%{[1;38;5;11m%}'
                local track_unstagestr_style='%{[1;38;5;9m%}'
                ;;
            *)
                ;;
        esac
        local status_char='%(?.✔︎.✖︎)'
        local prompt_status='${status_style}${status_char} ${reset_style} '
        local prompt_ssh=''
        if [ -n "${SSH_CLIENT}${SSH_CONNECTION}" ]; then
            prompt_ssh='${ssh_style}[ssh://%n@%M] ${reset_style}'
        fi
        local prompt_path='${path_style}%~ ${reset_style}'
        autoload -Uz vcs_info
        zstyle ':vcs_info:*' enable git hg svn
        [[ ${is-at-least 4.3.10} ]] && zstyle ':vcs_info:*' check-for-changes true
        zstyle ':vcs_info:*' stagedstr '${track_stagestr_style}!%{${reset_style}${track_style}%}'
        zstyle ':vcs_info:*' unstagedstr '${track_unstagestr_style}+%{${reset_style}${track_style}%}'
        zstyle ':vcs_info:*' formats '${track_style}%s::%b%u%c'
        zstyle ':vcs_info:*' actionformats '${track_style}%s::%b%u%c-%a'
        update_prompt(){
            LANG=en_US.UTF-8 vcs_info
            PROMPT="
${prompt_status}${prompt_ssh}${prompt_path}${vcs_info_msg_0_}${reset_style}
%(!.#.>) "
        }
        add-zsh-hook precmd update_prompt
        PROMPT2="%(!.#.|)> "
esac
