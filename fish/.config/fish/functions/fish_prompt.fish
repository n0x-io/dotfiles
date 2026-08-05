set fish_prompt_pwd_dir_length 0
set __fish_git_prompt_show_informative_status 1

# Command and parameter colors come from fish_variables (Cursor Dark)

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'

# Colors mirror Cursor's git decorations
set __fish_git_prompt_color_branch 569CD6
set __fish_git_prompt_color_dirtystate E2C08D
set __fish_git_prompt_color_stagedstate 73C991
set __fish_git_prompt_color_upstream 4EC9B0
set __fish_git_prompt_color_cleanstate 73C991
set __fish_git_prompt_color_invalidstate E4676B

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles ' …'
set __fish_git_prompt_char_cleanstate '✓'
set __fish_git_prompt_char_stagedstate '⇢ '
set __fish_git_prompt_char_conflictedstate "✕"

set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo C586C0
  else
    echo F14C4C
  end
end

function fish_prompt
  set -l last_status $status

  # username and hostname
  _print_in_color "┏["$USER"@"(prompt_hostname)"]" 569CD6

  # current working dir
  _print_in_color " "(prompt_pwd) $fish_color_cwd

  __fish_git_prompt " (%s)"

  # beginning of new line
  _print_in_color "\n┗" 569CD6

  # time information
  _print_in_color " "(date "+%H:%M:%S") 73C991

  # little error that indicates the status of the previous command
  _print_in_color " ❯ " (_prompt_color_for_status $last_status)
end
