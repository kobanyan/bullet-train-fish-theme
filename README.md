# Bullet Train for fish

Bullet Train **for fish** is reimplementaion of
[Bullet Train for oh-my-zsh](https://github.com/caiogondim/bullet-train-oh-my-zsh-theme)
as [fish shell](https://github.com/fish-shell/fish-shell)
theme.

It currently shows:
- Current Python virtualenv; when using Pyenv and no active virtualenv shows the current Python version the shell uses
- Current Ruby version using chruby; version and gemset when on RVM or Rbenv
- Current Node.js version, through NVM (if present) or Node.js
- Current Perl version using plenv
- Git status
- Timestamp
- Current directory
- Background jobs
- Exit code of last command

Some features are slightly different from [the original](https://github.com/caiogondim/bullet-train-oh-my-zsh-theme).


## Requirements

In order to use the theme, you will first need:

* Powerline compatible fonts like [Vim Powerline patched fonts](https://github.com/Lokaltog/powerline-fonts), [Input Mono](http://input.fontbureau.com/) or [Monoid](http://larsenwork.com/monoid/).
* On Ubuntu like systems you'll need the `ttf-ancient-fonts` package to correctly display some unicode symbols that are not covered by the Powerline fonts above.
* Make sure terminal is using 256-colors mode with `set -g TERM "xterm-256color"`
* For [iTerm 2](http://iterm2.com/) users, make sure you go into your settings and set both the regular font and the non-ascii font to powerline compatible [fonts](https://github.com/powerline/fonts) or the prompt separators and special characters will not display correctly.


## Installing

### For oh-my-fish users

```bash
omf install https://github.com/kobanyan/bullet-train-fish-theme
```

### For fisherman users

```bash
fisher kobanyan/bullet-train-fish-theme
```

### Others

Copy `fish_prompt.fish` file to `~/.config/fish/functions/fish_prompt.fish`

## Options

Bullet Train is configurable. You can change colors and which segments you want
or don't want to see. All options must be overridden in `~/.config/fish/config.fish`.

### Order
`BULLETTRAIN_PROMPT_ORDER` defines order of prompt segments. Use fish list
syntax to specify your own order, e.g:

```bash
set -g BULLETTRAIN_PROMPT_ORDER \
  git \
  context \
  dir \
  time
```

NOTE: You do not need to specify *end* segment - it will be added automatically. With this you can also specify custom segments.

### Prompt (Segment Name: `prompt`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_PROMPT_CHAR`|`\$`|Character to be show before any command
|`BULLETTRAIN_PROMPT_ROOT`|`true`|Highlight if running as root
|`BULLETTRAIN_PROMPT_SEPARATE_LINE`|`true`|Make the prompt span across two lines
|`BULLETTRAIN_PROMPT_ADD_NEWLINE`|`true`|Adds a newline character before each prompt line

### Time (Segment Name: `time`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_TIME_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_TIME_12HR`|`false`|Format time using 12-hour clock (am/pm)
|`BULLETTRAIN_TIME_BG`|`white`|Background color
|`BULLETTRAIN_TIME_FG`|`black`|Foreground color

### Status (Segment Name: `status`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_STATUS_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_STATUS_EXIT_SHOW`|`false`|Show/hide exit code of last command
|`BULLETTRAIN_STATUS_BG`|`green`|Background color
|`BULLETTRAIN_STATUS_ERROR_BG`|`red`|Background color of segment when last command exited with an error
|`BULLETTRAIN_STATUS_FG`|`black`|Foreground color
|`BULLETTRAIN_STATUS_ERROR`|`✘`|Icon to be show when last command exited with an error
|`BULLETTRAIN_STATUS_ROOT`|`⚡`|Icon to be show when last command run as root
|`BULLETTRAIN_STATUS_JOB`|`⚙`|Icon to be show when last command was job

### Custom (Segment Name: `custom`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_CUSTOM_MSG`|none|Free segment you can put a custom message
|`BULLETTRAIN_CUSTOM_BG`|`black`|Background color
|`BULLETTRAIN_CUSTOM_FG`|`white`|Foreground color

### Context (Segment Name: `context`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_CONTEXT_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_CONTEXT_BG`|`black`|Background color
|`BULLETTRAIN_CONTEXT_FG`|`white`|Foreground color
|`BULLETTRAIN_CONTEXT_DEFAULT_USER`|none|Default user. If you are running with other user other than default, the segment will be showed.
|`BULLETTRAIN_CONTEXT_HOSTNAME`|`(hostname -s)`|Hostname. Set %M to display the full qualified domain name.
|`BULLETTRAIN_IS_SSH_CLIENT`|`false`|If `true`, the segment will be showed.

### Dir (Segment Name: `dir`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_DIR_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_DIR_BG`|`blue`|Background color
|`BULLETTRAIN_DIR_FG`|`white`|Foreground color
|`BULLETTRAIN_DIR_CONTEXT_SHOW`|`false`|Show user and machine in an SCP formatted style
|`BULLETTRAIN_DIR_EXTENDED`|`0`|Extended path (-1:$PWD, >=0:set value to `fish_prompt_dir_length` and call `prompt_pwd`)

### Perl plenv (Segment Name: `perl`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_PERL_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_PERL_BG`|`yellow`|Background color
|`BULLETTRAIN_PERL_FG`|`white`|Foreground color
|`BULLETTRAIN_PERL_PREFIX`|`"🐪 "`|Prefix of the segment

### Ruby rbenv/RVM/chruby (Segment Name: `ruby`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_RUBY_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_RUBY_BG`|`magenta`|Background color
|`BULLETTRAIN_RUBY_FG`|`white`|Foreground color
|`BULLETTRAIN_RUBY_PREFIX`|`"💎 "`|Prefix of the segment
|`BULLETTRAIN_RUBY_SHOW_SYSTEM`|`true`|Show/hide `system` version

### Python virtualenv/pyenv (Segment Name: `python`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_PYTHON_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_PYTHON_BG`|`yellow`|Background color
|`BULLETTRAIN_PYTHON_FG`|`white`|Foreground color
|`BULLETTRAIN_PYTHON_PREFIX`|`"🐍 "`|Prefix of the segment
|`BULLETTRAIN_PYTHON_SHOW_SYSTEM`|`true`|Show/hide `system` version

Set `true` as default `VIRTUAL_ENV_DISABLE_PROMPT` value.

### Node.js nvm (Segment Name: `nodejs`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_NODEJS_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_NODEJS_BG`|`green`|Background color
|`BULLETTRAIN_NODEJS_FG`|`white`|Foreground color
|`BULLETTRAIN_NODEJS_PREFIX`|`⬢`|Prefix of the segment

### Go (Segment Name: `go`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_GO_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_GO_BG`|`cyan`|Background color
|`BULLETTRAIN_GO_FG`|`white`|Foreground color
|`BULLETTRAIN_GO_PREFIX`|`"🐭 "`|Prefix of the segment

### Git (Segment Name: `git`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_GIT_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_GIT_COLORIZE_DIRTY`|`false`|Set `BULLETTRAIN_GIT_COLORIZE_DIRTY_(BG|FG)` to `BULLETTRAIN_GIT_(BG|FG)` in dirty state
|`BULLETTRAIN_GIT_COLORIZE_DIRTY_BG`|`yellow`|`BULLETTRAIN_GIT_BG` in dirty state
|`BULLETTRAIN_GIT_COLORIZE_DIRTY_FG`|`black`|`BULLETTRAIN_GIT_FG` in dirty state
|`BULLETTRAIN_GIT_BG`|`white`|Background color
|`BULLETTRAIN_GIT_FG`|`black`|Foreground color
|`BULLETTRAIN_GIT_EXTENDED`|`true`|
|`BULLETTRAIN_GIT_PREFIX`|``|Prefix
|`BULLETTRAIN_GIT_SUFFIX`|none|Suffix
|`BULLETTRAIN_GIT_DIRTY_FG`|`red`|Foreground color for `BULLETTRAIN_GIT_DIRTY`
|`BULLETTRAIN_GIT_DIRTY`|`✘`|Icon for dirty state
|`BULLETTRAIN_GIT_CLEAN_FG`|`green`|Foreground color for `BULLETTRAIN_GIT_CLEAN`
|`BULLETTRAIN_GIT_CLEAN`|`✔`|Icon for clean state
|`BULLETTRAIN_GIT_ADDED_FG`|`green`|Foreground color for `BULLETTRAIN_GIT_ADDED`
|`BULLETTRAIN_GIT_ADDED`|`✚`|Icon for added files on stage
|`BULLETTRAIN_GIT_MODIFIED_FG`|`blue`|Foreground color for `BULLETTRAIN_GIT_MODIFIED`
|`BULLETTRAIN_GIT_MODIFIED`|`✹`|Icon for modified files
|`BULLETTRAIN_GIT_DELETED_FG`|`red`|Foreground color for `BULLETTRAIN_GIT_DELETED`
|`BULLETTRAIN_GIT_DELETED`|`✖`|Icon for delete files on stage
|`BULLETTRAIN_GIT_UNTRACKED_FG`|`yellow`|Foreground color for `BULLETTRAIN_GIT_UNTRACKED`
|`BULLETTRAIN_GIT_UNTRACKED`|`✭`|Icon for untracked files
|`BULLETTRAIN_GIT_RENAMED_FG`|`black`|Foreground color for `BULLETTRAIN_GIT_RENAMED`
|`BULLETTRAIN_GIT_RENAMED`|`➜`|Icon for renamed
|`BULLETTRAIN_GIT_UNMERGED_FG`|`black`|Foreground color for `BULLETTRAIN_GIT_UNMERGED`
|`BULLETTRAIN_GIT_UNMERGED`|`═`|Icon for unmerged state
|`BULLETTRAIN_GIT_STASHED_FG`|`black`|Foreground color for `BULLETTRAIN_GIT_STASHED`
|`BULLETTRAIN_GIT_STASHED`|`◼`|Icon for stashed state
|`BULLETTRAIN_GIT_AHEAD_FG`|`black`|Foreground color for `BULLETTRAIN_GIT_AHEAD`
|`BULLETTRAIN_GIT_AHEAD`|`⬆`|Icon for ahead state from remote
|`BULLETTRAIN_GIT_BEHIND_FG`|`black`|Foreground color for `BULLETTRAIN_GIT_BEHIND`
|`BULLETTRAIN_GIT_BEHIND`|`⬇`|Icon for behind state from remote
|`BULLETTRAIN_GIT_DIVERGED_FG`|`black`|Foreground color for `BULLETTRAIN_GIT_DIVERGED`
|`BULLETTRAIN_GIT_DIVERGED`|`⬍`|Icon for diverged state from remote
|`BULLETTRAIN_GIT_DISABLE_UNTRACKED_FILES_DIRTY`|`false`|Ignore untracked files at checking if dirty state

### Mercurial/HG (Segment Name: `hg`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_HG_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_HG_COLORIZE_DIRTY`|`false`|Set `BULLETTRAIN_HG_COLORIZE_DIRTY_(BG|FG)` to `BULLETTRAIN_HG_(BG|FG)` in dirty state
|`BULLETTRAIN_HG_COLORIZE_DIRTY_BG`|`yellow`|`BULLETTRAIN_HG_BG` in dirty state
|`BULLETTRAIN_HG_COLORIZE_DIRTY_FG`|`black`|`BULLETTRAIN_HG_FG` in dirty state
|`BULLETTRAIN_HG_BG`|`white`|Background color
|`BULLETTRAIN_HG_FG`|`black`|Foreground color
|`BULLETTRAIN_HG_PREFIX`|`☿`|Prefix
|`BULLETTRAIN_HG_DIRTY`|`±`|Icon for dirty state
|`BULLETTRAIN_HG_NOT_ADDED_FG`|`green`|Foreground color for `BULLETTRAIN_HG_DIRTY` when added files exist
|`BULLETTRAIN_HG_MODIFIED_FG`|`blue`|Foreground color for `BULLETTRAIN_HG_DIRTY` when modified files exist

### Command execution time (Segment Name: `cmd_exec_time`)

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_EXEC_TIME_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_EXEC_TIME_ELAPSED`|5|Minimum elapsed time of command execution. If the execution time of a command is smaller than this, the segment will be hidden.
|`BULLETTRAIN_EXEC_TIME_BG`|`yellow`|Background color
|`BULLETTRAIN_EXEC_TIME_FG`|`black`|Foreground color


## Credits

This theme is heavily, heavily, heavily inspired by the [@caiogondim](https://github.com/caiogondim)'s [Bullet Train for oh-my-zsh](https://github.com/caiogondim/bullet-train-oh-my-zsh-theme) themes.
