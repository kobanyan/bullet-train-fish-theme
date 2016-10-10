function fish_prompt
  set -g retval $status
  set -g segment_separator ""
  set -g current_bg normal
  setup_parameters
  test $BULLETTRAIN_PROMPT_ADD_NEWLINE; and echo ""
  for segment in $BULLETTRAIN_PROMPT_ORDER
    eval "prompt_$segment"
  end
  prompt_end
  prompt_char
  reset_color
end

function setup_parameters -d "Set default value if parameter is not declared"
  # prompt
  test $BULLETTRAIN_PROMPT_CHAR; or set -g BULLETTRAIN_PROMPT_CHAR '$'
  test $BULLETTRAIN_PROMPT_ROOT; or set -g BULLETTRAIN_PROMPT_ROOT true
  test $BULLETTRAIN_PROMPT_SEPARATE_LINE; or set -g BULLETTRAIN_PROMPT_SEPARATE_LINE true
  test $BULLETTRAIN_PROMPT_ADD_NEWLINE; or set -g BULLETTRAIN_PROMPT_ADD_NEWLINE true
  # time
  test $BULLETTRAIN_TIME_SHOW; or set -g BULLETTRAIN_TIME_SHOW true
  test $BULLETTRAIN_TIME_12HR; or set -g BULLETTRAIN_TIME_12HR
  test $BULLETTRAIN_TIME_BG; or set -g BULLETTRAIN_TIME_BG white
  test $BULLETTRAIN_TIME_FG; or set -g BULLETTRAIN_TIME_FG black
  # status
  test $BULLETTRAIN_STATUS_SHOW; or set -g BULLETTRAIN_STATUS_SHOW true
  test $BULLETTRAIN_STATUS_EXIT_SHOW; or set -g BULLETTRAIN_STATUS_EXIT_SHOW
  test $BULLETTRAIN_STATUS_BG; or set -g BULLETTRAIN_STATUS_BG green
  test $BULLETTRAIN_STATUS_ERROR_BG; or set -g BULLETTRAIN_STATUS_ERROR_BG red
  test $BULLETTRAIN_STATUS_FG; or set -g BULLETTRAIN_STATUS_FG white
  test $BULLETTRAIN_STATUS_ERROR; or set -g BULLETTRAIN_STATUS_ERROR "✘"
  test $BULLETTRAIN_STATUS_ROOT; or set -g BULLETTRAIN_STATUS_ROOT "⚡"
  test $BULLETTRAIN_STATUS_JOB; or set -g BULLETTRAIN_STATUS_JOB "⚙"
  # custom
  test $BULLETTRAIN_CUSTOM_MSG; or set -g BULLETTRAIN_CUSTOM_MSG
  test $BULLETTRAIN_CUSTOM_BG; or set -g BULLETTRAIN_CUSTOM_BG black
  test $BULLETTRAIN_CUSTOM_FG; or set -g BULLETTRAIN_CUSTOM_FG white
  # context
  test $BULLETTRAIN_CONTEXT_SHOW; or set -g BULLETTRAIN_CONTEXT_SHOW
  test $BULLETTRAIN_CONTEXT_BG; or set -g BULLETTRAIN_CONTEXT_BG black
  test $BULLETTRAIN_CONTEXT_FG; or set -g BULLETTRAIN_CONTEXT_FG white
  test $BULLETTRAIN_CONTEXT_DEFAULT_USER; or set -g BULLETTRAIN_CONTEXT_DEFAULT_USER
  test $BULLETTRAIN_CONTEXT_HOSTNAME; or set -g BULLETTRAIN_CONTEXT_HOSTNAME (hostname -s)
  test $BULLETTRAIN_IS_SSH_CLIENT; or set -g BULLETTRAIN_IS_SSH_CLIENT
  # dir
  test $BULLETTRAIN_DIR_SHOW; or set -g BULLETTRAIN_DIR_SHOW true
  test $BULLETTRAIN_DIR_BG; or set -g BULLETTRAIN_DIR_BG blue
  test $BULLETTRAIN_DIR_FG; or set -g BULLETTRAIN_DIR_FG white
  test $BULLETTRAIN_DIR_CONTEXT_SHOW; or set -g BULLETTRAIN_DIR_CONTEXT_SHOW
  test $BULLETTRAIN_DIR_EXTENDED; or set -g BULLETTRAIN_DIR_EXTENDED 0
  # perl
  test $BULLETTRAIN_PERL_SHOW; or set -g BULLETTRAIN_PERL_SHOW
  test $BULLETTRAIN_PERL_BG; or set -g BULLETTRAIN_PERL_BG yellow
  test $BULLETTRAIN_PERL_FG; or set -g BULLETTRAIN_PERL_FG white
  test $BULLETTRAIN_PERL_PREFIX; or set -g BULLETTRAIN_PERL_PREFIX "🐪 "
  # ruby
  test $BULLETTRAIN_RUBY_SHOW; or set -g BULLETTRAIN_RUBY_SHOW true
  test $BULLETTRAIN_RUBY_BG; or set -g BULLETTRAIN_RUBY_BG magenta
  test $BULLETTRAIN_RUBY_FG; or set -g BULLETTRAIN_RUBY_FG white
  test $BULLETTRAIN_RUBY_PREFIX; or set -g BULLETTRAIN_RUBY_PREFIX "💎 "
  # python
  test $BULLETTRAIN_PYTHON_SHOW; or set -g BULLETTRAIN_PYTHON_SHOW true
  test $BULLETTRAIN_PYTHON_BG; or set -g BULLETTRAIN_PYTHON_BG yellow
  test $BULLETTRAIN_PYTHON_FG; or set -g BULLETTRAIN_PYTHON_FG white
  test $BULLETTRAIN_PYTHON_PREFIX; or set -g BULLETTRAIN_PYTHON_PREFIX "🐍 "
  test $VIRTUAL_ENV_DISABLE_PROMPT; or set -g VIRTUAL_ENV_DISABLE_PROMPT true
  # node
  test $BULLETTRAIN_NODEJS_SHOW; or set -g BULLETTRAIN_NODEJS_SHOW
  test $BULLETTRAIN_NODEJS_BG; or set -g BULLETTRAIN_NODEJS_BG green
  test $BULLETTRAIN_NODEJS_FG; or set -g BULLETTRAIN_NODEJS_FG white
  test $BULLETTRAIN_NODEJS_PREFIX; or set -g BULLETTRAIN_NODEJS_PREFIX ⬢
  # go
  test $BULLETTRAIN_GO_SHOW; or set -g BULLETTRAIN_GO_SHOW
  test $BULLETTRAIN_GO_BG; or set -g BULLETTRAIN_GO_BG cyan
  test $BULLETTRAIN_GO_FG; or set -g BULLETTRAIN_GO_FG white
  test $BULLETTRAIN_GO_PREFIX; or set -g BULLETTRAIN_GO_PREFIX "🐭 "
  # git
  test $BULLETTRAIN_GIT_SHOW; or set -g BULLETTRAIN_GIT_SHOW true
  test $BULLETTRAIN_GIT_COLORIZE_DIRTY; or set -g BULLETTRAIN_GIT_COLORIZE_DIRTY
  test $BULLETTRAIN_GIT_COLORIZE_DIRTY_BG; or set -g BULLETTRAIN_GIT_COLORIZE_DIRTY_BG yellow
  test $BULLETTRAIN_GIT_COLORIZE_DIRTY_FG; or set -g BULLETTRAIN_GIT_COLORIZE_DIRTY_FG black
  test $BULLETTRAIN_GIT_BG; or set -g BULLETTRAIN_GIT_BG white
  test $BULLETTRAIN_GIT_FG; or set -g BULLETTRAIN_GIT_FG black
  # test $BULLETTRAIN_GIT_PROMPT_CMD; or set -g BULLETTRAIN_GIT_PROMPT_CMD git_prompt_info
  test $BULLETTRAIN_GIT_EXTENDED; or set -g BULLETTRAIN_GIT_EXTENDED true
  test $BULLETTRAIN_GIT_PREFIX; or set -g BULLETTRAIN_GIT_PREFIX 
  test $BULLETTRAIN_GIT_SUFFIX; or set -g BULLETTRAIN_GIT_SUFFIX
  test $BULLETTRAIN_GIT_DIRTY_FG; or set -g BULLETTRAIN_GIT_DIRTY_FG red
  test $BULLETTRAIN_GIT_DIRTY; or set -g BULLETTRAIN_GIT_DIRTY ✘
  test $BULLETTRAIN_GIT_CLEAN_FG; or set -g BULLETTRAIN_GIT_CLEAN_FG green
  test $BULLETTRAIN_GIT_CLEAN; or set -g BULLETTRAIN_GIT_CLEAN ✔
  test $BULLETTRAIN_GIT_ADDED_FG; or set -g BULLETTRAIN_GIT_ADDED_FG green
  test $BULLETTRAIN_GIT_ADDED; or set -g BULLETTRAIN_GIT_ADDED ✚
  test $BULLETTRAIN_GIT_MODIFIED_FG; or set -g BULLETTRAIN_GIT_MODIFIED_FG blue
  test $BULLETTRAIN_GIT_MODIFIED; or set -g BULLETTRAIN_GIT_MODIFIED ✹
  test $BULLETTRAIN_GIT_DELETED_FG; or set -g BULLETTRAIN_GIT_DELETED_FG red
  test $BULLETTRAIN_GIT_DELETED; or set -g BULLETTRAIN_GIT_DELETED ✖
  test $BULLETTRAIN_GIT_UNTRACKED_FG; or set -g BULLETTRAIN_GIT_UNTRACKED_FG yellow
  test $BULLETTRAIN_GIT_UNTRACKED; or set -g BULLETTRAIN_GIT_UNTRACKED ✭
  test $BULLETTRAIN_GIT_RENAMED_FG; or set -g BULLETTRAIN_GIT_RENAMED_FG black
  test $BULLETTRAIN_GIT_RENAMED; or set -g BULLETTRAIN_GIT_RENAMED ➜
  test $BULLETTRAIN_GIT_UNMERGED_FG; or set -g BULLETTRAIN_GIT_UNMERGED_FG black
  test $BULLETTRAIN_GIT_UNMERGED; or set -g BULLETTRAIN_GIT_UNMERGED ═
  test $BULLETTRAIN_GIT_STASHED_FG; or set -g BULLETTRAIN_GIT_STASHED_FG black
  test $BULLETTRAIN_GIT_STASHED; or set -g BULLETTRAIN_GIT_STASHED ◼
  test $BULLETTRAIN_GIT_AHEAD_FG; or set -g BULLETTRAIN_GIT_AHEAD_FG black
  test $BULLETTRAIN_GIT_AHEAD; or set -g BULLETTRAIN_GIT_AHEAD ⬆
  test $BULLETTRAIN_GIT_BEHIND_FG; or set -g BULLETTRAIN_GIT_BEHIND_FG black
  test $BULLETTRAIN_GIT_BEHIND; or set -g BULLETTRAIN_GIT_BEHIND ⬇
  test $BULLETTRAIN_GIT_DIVERGED_FG; or set -g BULLETTRAIN_GIT_DIVERGED_FG black
  test $BULLETTRAIN_GIT_DIVERGED; or set -g BULLETTRAIN_GIT_DIVERGED ⬍
  test $BULLETTRAIN_GIT_DISABLE_UNTRACKED_FILES_DIRTY; or set -g BULLETTRAIN_GIT_DISABLE_UNTRACKED_FILES_DIRTY
  # mercurial/hg
  test $BULLETTRAIN_HG_SHOW; or set -g BULLETTRAIN_HG_SHOW true
  test $BULLETTRAIN_HG_COLORIZE_DIRTY; or set -g BULLETTRAIN_HG_COLORIZE_DIRTY
  test $BULLETTRAIN_HG_COLORIZE_DIRTY_BG; or set -g BULLETTRAIN_HG_COLORIZE_DIRTY_BG yellow
  test $BULLETTRAIN_HG_COLORIZE_DIRTY_FG; or set -g BULLETTRAIN_HG_COLORIZE_DIRTY_FG black
  test $BULLETTRAIN_HG_BG; or set -g BULLETTRAIN_HG_BG white
  test $BULLETTRAIN_HG_FG; or set -g BULLETTRAIN_HG_FG black
  test $BULLETTRAIN_HG_PREFIX; or set -g BULLETTRAIN_HG_PREFIX ☿
  test $BULLETTRAIN_HG_DIRTY; or set -g BULLETTRAIN_HG_DIRTY ±
  test $BULLETTRAIN_HG_NOT_ADDED_FG; or set -g BULLETTRAIN_HG_NOT_ADDED_FG green
  test $BULLETTRAIN_HG_MODIFIED_FG; or set -g BULLETTRAIN_HG_MODIFIED_FG blue
  # time
  test $BULLETTRAIN_EXEC_TIME_SHOW; or set -g BULLETTRAIN_EXEC_TIME_SHOW
  test $BULLETTRAIN_EXEC_TIME_ELAPSED; or set -g BULLETTRAIN_EXEC_TIME_ELAPSED 5
  test $BULLETTRAIN_EXEC_TIME_BG; or set -g BULLETTRAIN_EXEC_TIME_BG yellow
  test $BULLETTRAIN_EXEC_TIME_FG; or set -g BULLETTRAIN_EXEC_TIME_FG black
  set -l _prompt_order \
    time \
    status \
    custom \
    context \
    dir \
    perl \
    ruby \
    python \
    nodejs \
    go \
    git \
    hg \
    cmd_exec_time
  test "$BULLETTRAIN_PROMPT_ORDER"; or set -g BULLETTRAIN_PROMPT_ORDER $_prompt_order
end

function prompt_segment -a bg fg prompt
  set -l _bg
  set -l _fg
  set -l _separates
  test $bg; and set _bg $bg; or set _bg normal
  test $fg; and set _fg $fg; or set _fg normal
  test "$current_bg" != "normal";
    and test "$bg" != "$current_bg";
      and set _separates true
  prompt_separator $_bg $_fg $_separates
  echo -n " "
  set current_bg $bg
  test $prompt; and echo -n "$prompt"
end

function prompt_separator -a bg fg separates
  if test $separates
    echo -n " "
    set_color -b $bg
    set_color $current_bg
    echo -n "$segment_separator"
  else
    set_color -b $bg
  end
  set_color $fg
end

function prompt_end
  prompt_separator normal normal $current_bg
  set -e current_bg
end

function reset_color
  set_color normal
end

function prompt_char
  test "$BULLETTRAIN_PROMPT_SEPARATE_LINE" = "true";
    and echo "";
    or  echo -n " "

  set -l _fg normal
  test (whoami) = "root"; and set _fg green

  set_color $_fg
  echo -n "$BULLETTRAIN_PROMPT_CHAR "
end

function prompt_time -d "Show current time"
  test "$BULLETTRAIN_TIME_SHOW" = "true"; or return

  test "$BULLETTRAIN_TIME_12HR" = "true";
    and prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG (date "+%r");
    or  prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG (date "+%T")
end

function prompt_status -d "Show last command status"
  test "$BULLETTRAIN_STATUS_SHOW" = "true"; or return

  set -l _bg
  set -l _fg $BULLETTRAIN_STATUS_FG
  set -l _symbols
  if test $retval != 0
    set _bg $BULLETTRAIN_STATUS_ERROR_BG
    set _symbols $_symbols $BULLETTRAIN_STATUS_ERROR
    test "$BULLETTRAIN_STATUS_EXIT_SHOW" = "true";
      and set _symbols $_symbols $retval
  else
    set _bg $BULLETTRAIN_STATUS_BG
  end
  test (id -u) -eq 0; and set _symbols $_symbols $BULLETTRAIN_STATUS_ROOT
  test (jobs -l | wc -l) -gt 0; and set _symbols $_symbols $BULLETTRAIN_STATUS_JOB
  test "$_symbols"; and prompt_segment $_bg $_fg "$_symbols"
end

function prompt_custom -d "Show custome message"
  test "$BULLETTRAIN_CUSTOM_MSG"; or return

  prompt_segment $BULLETTRAIN_CUSTOM_BG $BULLETTRAIN_CUSTOM_FG $BULLETTRAIN_CUSTOM_MSG
end

function context
  test "$USER" != "$BULLETTRAIN_CONTEXT_DEFAULT_USER" -o -n "$BULLETTRAIN_IS_SSH_CLIENT";
    and echo -n "$USER@$BULLETTRAIN_CONTEXT_HOSTNAME"
end

function prompt_context -d "Show context"
  test "$BULLETTRAIN_CONTEXT_SHOW" = "true"; or return

  set -l _context (context)
  test "$_context";
    and prompt_segment $BULLETTRAIN_CONTEXT_BG $BULLETTRAIN_CONTEXT_FG $_context
end

function prompt_dir -d "Show current directory"
  test "$BULLETTRAIN_DIR_SHOW" = "true"; or return

  set -l _dir
  test "$BULLETTRAIN_DIR_CONTEXT_SHOW" = "true";
    and set -l _context (context);
      and test "$_context";
        and set _dir "$_context:"

  switch $BULLETTRAIN_DIR_EXTENDED
  case -1
    set _dir "$_dir$PWD"
  case "*"
    set -g fish_prompt_pwd_dir_length $BULLETTRAIN_DIR_EXTENDED
    set _dir "$_dir"(prompt_pwd)
  end

  prompt_segment $BULLETTRAIN_DIR_BG $BULLETTRAIN_DIR_FG "$_dir"
end

function prompt_perl -d "Show perl environment"
  test "$BULLETTRAIN_PERL_SHOW" = "true"; or return

  test (command -v plenv);
    and set -l _version $BULLETTRAIN_PERL_PREFIX (plenv version | sed -e 's/ (set.*$//');
      and prompt_segment $BULLETTRAIN_PERL_BG $BULLETTRAIN_PERL_FG "$_version"
end

function prompt_ruby -d "Show ruby environment"
  test "$BULLETTRAIN_RUBY_SHOW" = "true"; or return

  set -l _ruby_prompt
  if test (command -v rbenv)
    set -l _version (rbenv version | sed -e 's/ (set.*$//')
    set -l _gemset (rbenv gemset active ^ /dev/null | sed -e 's/ global$//')
    test "$_gemset";
      and set _ruby_prompt $_version"@"$_gemset;
      or  set _ruby_prompt $_version
  else if test (command -v rvm-prompt)
    set _ruby_prompt (rvm-prompt i v g)
  else if test (command -v chruby)
    set _ruby_prompt (chruby | sed -n -e 's/ \* //p')
  end

  test "$_ruby_prompt";
    and set _ruby_prompt $BULLETTRAIN_RUBY_PREFIX $_ruby_prompt;
      and prompt_segment $BULLETTRAIN_RUBY_BG $BULLETTRAIN_RUBY_FG "$_ruby_prompt"
end

function prompt_python -d "Show python environment"
  test "$BULLETTRAIN_PYTHON_SHOW" = "true"; or return

  set -l _python_prompt
  if test "$VIRTUAL_ENV" -a "$VIRTUAL_ENV_DISABLE_PROMPT" = "true"
    set _python_prompt (basename $VIRTUAL_ENV)
  else if test (command -v pyenv)
    set _python_prompt (pyenv version | sed -e 's/ (set.*$//' | tr '\n' ' ' | sed 's/.$//')
  end

  test "$_python_prompt";
    and set _python_prompt $BULLETTRAIN_PYTHON_PREFIX $_python_prompt;
      and prompt_segment $BULLETTRAIN_PYTHON_BG $BULLETTRAIN_PYTHON_FG "$_python_prompt"
end

function prompt_nodejs -d "Show node.js environment"
  test "$BULLETTRAIN_NODEJS_SHOW" = "true"; or return

  set -l _nodejs_prompt
  test (command -v nvm);
    and set _nodejs_prompt (nvm current ^ /dev/null);
    or  test (command -v node);
      and set _nodejs_prompt (node --version ^ /dev/null | tail -n1)

  test "$_nodejs_prompt";
    and set _nodejs_prompt $BULLETTRAIN_NODEJS_PREFIX $_nodejs_prompt;
      and prompt_segment $BULLETTRAIN_NODEJS_BG $BULLETTRAIN_NODEJS_FG "$_nodejs_prompt"
end

function prompt_go -d "Show go environment"
  test "$BULLETTRAIN_GO_SHOW" = "true"; or return

  set -l _go_prompt
  test (command -v go);
    and set _go_prompt (go version | grep --colour=never -oE '[[:digit:]].[[:digit:]]')

  test "$_go_prompt";
    and set _go_prompt $BULLETTRAIN_GO_PREFIX $_go_prompt;
      and prompt_segment $BULLETTRAIN_GO_BG $BULLETTRAIN_GO_FG "$_go_prompt"
end

function prompt_git -d "Show git working tree info"
  test "$BULLETTRAIN_GIT_SHOW" = "true"; or return
  test (command -v git); or return
  test (git rev-parse --is-inside-work-tree ^ /dev/null); or return

  set -l _bg $BULLETTRAIN_GIT_BG
  set -l _fg $BULLETTRAIN_GIT_FG
  set -l _is_dirty (is_git_dirty)

  test "$BULLETTRAIN_GIT_COLORIZE_DIRTY" = "true";
    and test "$_is_dirty";
      and set _bg $BULLETTRAIN_GIT_COLORIZE_DIRTY_BG;
        and set _fg $BULLETTRAIN_GIT_COLORIZE_DIRTY_FG

  git_prompt_info $_bg $_fg $_is_dirty
  test "$BULLETTRAIN_GIT_EXTENDED" = "true"; and git_prompt_status $_bg $_fg
end

function git_prompt_info -a bg fg is_dirty
  set -l ref (git symbolic-ref HEAD ^ /dev/null);
    or set ref (git rev-parse --short HEAD ^ /dev/null);
      or return 0

  set -l _dirty $BULLETTRAIN_GIT_CLEAN
  test "$is_dirty" = "true"; and set _dirty $BULLETTRAIN_GIT_DIRTY;
  test "$BULLETTRAIN_GIT_PREFIX"; and prompt_segment $bg $fg $BULLETTRAIN_GIT_PREFIX
  prompt_segment $bg $fg (echo $ref | sed "s-refs/heads/--")
  prompt_segment $bg (test "$is_dirty" = "true"; and echo $BULLETTRAIN_GIT_DIRTY_FG; or echo $fg) $_dirty
  test "$BULLETTRAIN_GIT_SUFFIX"; and prompt_segment $bg $fg $BULLETTRAIN_GIT_SUFFIX
end

function is_git_dirty
  set -l _flgs "--porcelain"
  set -l _post_1_7_2_git (git_compare_version "1.7.2")
  test $_post_1_7_2_git -gt 0;
    set _flags $_flgs "--ignore-submodules=dirty"
  test "$BULLETTRAIN_GIT_DISABLE_UNTRACKED_FILES_DIRTY" = "true";
    set _flags $_flgs "--untracked-files=no"
  set -l _status (git status "$_flgs" ^ /dev/null | tail -n1)
  test "$_status"; and echo true
end

function git_compare_version -a version
  set -l _input_git_version (string split "." $version)
  set -l _installed_git_version (string split "." (git --version ^ /dev/null | cut -d' ' -f3))
  for i in (seq 3)
    test $_installed_git_version[$i] -gt $_input_git_version[$i];
      and echo 1;
        and return 0
    test $_installed_git_version[$i] -lt $_input_git_version[$i];
      and echo -1;
        and return 0
  end
  echo 0
end

function git_prompt_status -a bg fg
  git status --porcelain -b ^ /dev/null | read -lz _index
  test (find_from_lines '^## [^ ]\+ .*diverged' $_index);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_DIVERGED_FG $BULLETTRAIN_GIT_DIVERGED
  test (find_from_lines '^## [^ ]\+ .*behind' $_index);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_BEHIND_FG $BULLETTRAIN_GIT_BEHIND
  test (find_from_lines '^## [^ ]\+ .*ahead' $_index);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_AHEAD_FG $BULLETTRAIN_GIT_AHEAD
  test (find_from_lines '^UU ' $_index);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_UNMERGED_FG $BULLETTRAIN_GIT_UNMERGED
  test (git rev-parse --verify refs/stash ^ /dev/null);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_STASHED_FG $BULLETTRAIN_GIT_STASHED
  if begin test (find_from_lines '^ D ' $_index);
    or test (find_from_lines '^D  ' $_index);
    or test (find_from_lines '^AD ' $_index); end;
    git_prompt_segment $bg $fg $BULLETTRAIN_GIT_DELETED_FG $BULLETTRAIN_GIT_DELETED
  end
  test (find_from_lines '^R  ' $_index);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_RENAMED_FG $BULLETTRAIN_GIT_RENAMED
  if begin test (find_from_lines '^ M ' $_index);
    or test (find_from_lines '^AM ' $_index);
    or test (find_from_lines '^ T ' $_index); end;
    git_prompt_segment $bg $fg $BULLETTRAIN_GIT_MODIFIED_FG $BULLETTRAIN_GIT_MODIFIED
  end
  if begin test (find_from_lines '^A  ' $_index);
    or test (find_from_lines '^M  ' $_index); end;
    git_prompt_segment $bg $fg $BULLETTRAIN_GIT_ADDED_FG $BULLETTRAIN_GIT_ADDED
  end
  test (find_from_lines '^\?\? ' $_index);
    and git_prompt_segment $bg $fg $BULLETTRAIN_GIT_UNTRACKED_FG $BULLETTRAIN_GIT_UNTRACKED
end

function find_from_lines -a expr lines
  test (echo $lines | grep -E $expr | tail -n1); and echo true;
end

function git_prompt_segment -a bg base_fg fg prompt
  set -l _fg $base_fg
  test "$fg"; and set _fg $fg
  prompt_segment $bg $_fg $prompt
end

function prompt_hg -d "Show mercurial working tree info"
  test "$BULLETTRAIN_HG_SHOW" = "true"; or return
  test (command -v hg); or return

  set -l _hg_id (hg id -nb ^ /dev/null)
  test "$_hg_id"; or return

  set -l _rev (echo $_hg_id | cut -d' ' -f1 | sed 's/[^-0-9]//g')
  set -l _branch (echo $_hg_id | cut -d' ' -f2)
  set -l _hg_prompt $BULLETTRAIN_HG_PREFIX "$_rev@$_branch"
  set -l _dirty_fg
  hg st | read -lz _hg_st
  if test (find_from_lines "^\?" $_hg_st);
    set _dirty_fg $BULLETTRAIN_HG_NOT_ADDED_FG
  else if test (find_from_lines "^(M|A)" $_hg_st);
    set _dirty_fg $BULLETTRAIN_HG_MODIFIED_FG
  end

  set -l _bg $BULLETTRAIN_HG_BG
  set -l _fg $BULLETTRAIN_HG_FG
  test "$BULLETTRAIN_HG_COLORIZE_DIRTY" = "true";
    and test "$_dirty_fg";
      and set _bg $BULLETTRAIN_HG_COLORIZE_DIRTY_BG;
        and set _fg $BULLETTRAIN_HG_COLORIZE_DIRTY_FG
  prompt_segment $_bg $_fg "$_hg_prompt"

  test "$_dirty_fg";
    and set _fg $_dirty_fg;
      and prompt_segment $_bg $_fg $BULLETTRAIN_HG_DIRTY
end

function displaytime -a t
  set -l _d (math $t/60/60/24)
  set -l _h (math $t/60/60%24)
  set -l _m (math $t/60%60)
  set -l _s (math $t%60)
  test $_d -gt 0; and printf '%dd' $_d
  test $_h -gt 0; and printf '%dh' $_h
  test $_m -gt 0; and printf '%dm' $_m
  printf '%ds' $_s
end

function prompt_cmd_exec_time -d "Show last command exection time"
  test "$BULLETTRAIN_EXEC_TIME_SHOW" = "true"; or return

  set -l duration
  test "$CMD_DURATION";
    and set _duration (math $CMD_DURATION/1000);
      and test $_duration -gt $BULLETTRAIN_EXEC_TIME_ELAPSED;
        and prompt_segment \
          $BULLETTRAIN_EXEC_TIME_BG \
          $BULLETTRAIN_EXEC_TIME_FG \
          (displaytime $_duration);
end
