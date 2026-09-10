# Cursor Dark colour theme.
#
# Kept here as globals rather than only in fish_variables: fish's first-run
# migration (__fish_config_interactive, __fish_initialized < 3400) runs
# `fish_config theme save "fish default"`, which blanks every universal
# fish_color_*/fish_pager_color_* variable. Globals are re-applied on every
# start, so the theme survives that and travels with the repo.

set -g fish_color_normal normal
set -g fish_color_command 569CD6
set -g fish_color_keyword C586C0
set -g fish_color_quote CE9178
set -g fish_color_redirection 9CDCFE
set -g fish_color_end C586C0
set -g fish_color_error F14C4C
set -g fish_color_param normal
set -g fish_color_option 9CDCFE
set -g fish_color_comment 6A9955
set -g fish_color_selection E5E5E5 --bold --background=264F78
set -g fish_color_operator D4D4D4
set -g fish_color_escape D7BA7D
set -g fish_color_autosuggestion 666666
set -g fish_color_cwd 4EC9B0
set -g fish_color_cwd_root F14C4C
set -g fish_color_user 9CDCFE
set -g fish_color_host 569CD6
set -g fish_color_host_remote DCDCAA
set -g fish_color_cancel -r
set -g fish_color_search_match --background=264F78
set -g fish_color_match --background=264F78
set -g fish_color_history_current --bold
set -g fish_color_status F14C4C
set -g fish_color_valid_path --underline

set -g fish_pager_color_progress E5E5E5 --background=264F78
set -g fish_pager_color_background
set -g fish_pager_color_prefix 569CD6 --bold --underline
set -g fish_pager_color_completion normal
set -g fish_pager_color_description 9D9D9D
set -g fish_pager_color_selected_background --background=264F78
set -g fish_pager_color_selected_prefix 569CD6 --bold
set -g fish_pager_color_selected_completion E5E5E5
set -g fish_pager_color_selected_description 9D9D9D
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_prefix 569CD6
set -g fish_pager_color_secondary_completion normal
set -g fish_pager_color_secondary_description 9D9D9D
