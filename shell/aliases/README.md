# Aliases

## Purpose

Simpler (often one-liner) utilities are expressed as shell aliases.  They are
organized into similar groups, named "Collections".

### Summary

* [behave-like-linux](#behave-like-linux) - commands common to Linux that
should be on MacOS
* [dev-helpers](#dev-helpers)
* [ls](#ls) - (as in "LS" - not _is_); listing utilities
* [misc](#misc) - utilities that do not aid in software development
* [terse](#terse) - super-shorthand aliases
* [typos](#typos) - frequently used and frequently mistyped commands

## Collection

### `behave-like-linux`

Aliases for commands typically found on Linux distros.  Aliases included:

* `dos2unix`: DOS to UNIX text file format converter.

  **Usage**:

  ```bash
  dos2unix file_with_Windows_CR+LF_line_breaks
  ```

* `unix2dos`: UNIX to DOS text file format converter.

  **Usage**:

  ```bash
  unix2dos file_with_UNIX_LF_line_breaks
  ```

* `netstat-nlt`: Approximates the output of `netstat -nlt` on Linux.

  **Usage**:

  ```bash
  netstat-nlt
  ```

  **Output**:

  <!-- markdownlint-disable MD013 -->
  ```console
  com.docke 10000 stephen.kirkpatrick   10u  IPv4 0x6d923c0b0000000      0t0  TCP 127.0.0.1:52387 (LISTEN)
  com.docke 10300 stephen.kirkpatrick   55u  IPv6 0x6d923c070000000      0t0  TCP *:3306 (LISTEN)
  ruby      30000 stephen.kirkpatrick    9u  IPv4 0x6d923c0b0000000      0t0  TCP *:3000 (LISTEN)
  node      30100 stephen.kirkpatrick   24u  IPv4 0x6d923c0b0000000      0t0  TCP *:3035 (LISTEN)
  ```
  <!-- markdownlint-enable MD013 -->

  **Linux reference**

  ```console
  $ netstat -nlt
  Active Internet connections (only servers)
  Proto Recv-Q Send-Q Local Address           Foreign Address         State
  tcp        0      0 127.0.0.11:44327        0.0.0.0:*               LISTEN
  tcp6       0      0 :::3306                 :::*                    LISTEN
  ```

* `brewctl`: Shorthand for `brew services`.  Inspired by the `systemctl`
  command used to administer `Systemd` services.  Handy for someone used
  to working in `Systemd`-based systems or one who resorts to Google every
  time they need to remember how to start/restart a Brew service.  An
  unnecessary abstraction for everyone else.

  **Usage**:

  ```bash
  brewctl start mysql@5.7
  ```

### `dev-helpers`

Aliases useful for software development.  Aliases included:

* `myip`: Echos your computer's IP address.

  **Usage**:

  ```bash
  myip
  ```

  **Output**:

  ```console
  172.21.98.2
  ```

* `yarnls`: Lists all Node packages installed via yarn in current project

  **Usage**:

  ```bash
  cd project_root
  yarnls
  ```

  **Output**:

  ```console
  yarn list v1.19.2
  ├─ @babel/code-frame@7.10.4
  ├─ @babel/compat-data@7.10.5
  ├─ @babel/core@7.11.0
  .
  .
  .
  ├─ yaml@1.10.0
  ├─ yargs-parser@13.1.2
  └─ yargs@13.3.2
  ✨  Done in 0.74s.
  ```

* `bundle_1.17.3`: Runs Bundler version 1.17.3.  _Note: Bundler version 1.17.3
not included :)_

  **Usage**:

  ```bash
  bundle_1.17.3
  ```

### `ls`

Aliases for listing directories (or printers)

* `ls`: _Colorized listing_.  Aliased to `ls -G`, which enables colorized output.

  **Usage**:

  ```bash
  ls
  ```

* `l`: _Comma-delimited listing_.  Aliased to `ls -m`.  Shorthand from HP-UX.

  **Usage**:

  ```bash
  l
  ```

  **Output**:

  ```console
  Applications, Desktop, Documents, Downloads, file1.txt, file2.txt, ...
  ```

* `ll`: _Long listing_.  Aliased to `ls -l`.

  **Usage**:

  ```bash
  ll
  ```

  **Output**:

  ```console
  drwx------@   4 username  DOMAIN\User         128 Jan 01  2020 Applications
  drwx------+   3 username  DOMAIN\User          96 Jan 01  2020 Desktop
  drwx------+   3 username  DOMAIN\User          96 Jan 01  2020 Documents
  drwx------+   4 username  DOMAIN\User         128 Jan 01  2020 Downloads
  -rw-r--r--    1 username  DOMAIN\User          55 Apr 01  2020 file1.txt
  -rw-r--r--    1 username  DOMAIN\User         555 Apr 01  2020 file2.txt
  ```

* `l.`: _List hidden files and directories only_.  Compliments of RedHat

  **Usage**:

  ```bash
  l.
  ```

  **Output**:

  ```console
  .DS_Store
  .Trash
  .bashrc
  .bundle
  .ssh
  .vimrc
  .zshrc
  ```

* `lsp`: _List printers_.

  **Usage**:

  ```bash
  lsp
  ```

  **Output**:

  ```console
  FirstPrinter
  SecondPrinter
  ```
  
### `misc`

Aliases so random that they have no better place to go.

* `starwars`: Watch Episode IV in all of its ASCII art glory.

  **Usage**:
  
  ```bash
  starwars
  ```
  
  ![C3PO lecturing R2D2](images/c3po-telnet-star-wars.png)

### `terse`

Super-shorthand aliases to not-so-shorthand commands

* `h`: Display command history. _Aliased to `history`_.

  **Usage**:

  What was that `pip` command I ran earlier?

  ```bash
  h | grep pip
  ```

  What was I doing before I took lunch?

  ```bash
  h 10
  ```

  Note that commands can be re-executed by their number in the command
  history.  Taking the first question as an example, one can re-execute
  the Django installation by entering its number in the command history,
  preceded by a `!`.

  ```console
  $ h | grep pip
    278  which pip
    283  pip install Django==3.1.2

  $ !283
  ```

* `j`: Display jobs in current session **with** process ID.  _Aliased to
`jobs -l`_.

  **Usage**:

  ```console
  $ j
  [1]+ 23068 Suspended: 18           vim temp.txt
  [2]  23082 Suspended: 18           vim temp2.txt
  [3]- 23107 Suspended: 18           vim temp3.txt
  [4]  23649 Running                 xterm &
  [5]  23729 Running                 xclock &
  [6]  23797 Running                 xeyes &
  ```

  The basic format of the `jobs` output:

    | `Job Number` | `Default` | `PID` | `Status` | `Command` |

  The job number can be used with the `fg`, `bg`, `kill`, and `wait` commands.
  The second column indicates which process will be used as the default
for `fg` and `bg`.  A `+` indicates the default. A `-` indicates the default
if the current job exits.

* `lo`: Logout of current shell.  _Aliased to `logout`_.

* `pd`: Add current directory to the directory stack.  _Aliased to `pushd .`_.

  Pushes current working directory onto the directory stack, acting like
  a bookmark.

  **Usage**:

  ```bash
  pd

  ```

  **Example**:

  Imagine working in a deeply-nested directory and you need to switch to
  other directories to complete some tasks, before returning to your
  current directory...

  ```console
  $ pwd
  /Users/me/super-bash-bros/shell/aliases/images

  $ pd
  ~/super-bash-bros/shell/aliases/images ~/super-bash-bros/shell/aliases/images
  ```

  Change directories

  <!-- markdownlint-disable MD014 -->
  ```console
  $ cd ~/Documents/
  $ cd ~/Downloads/
  ```
  <!-- markdownlint-enable MD014 -->

  Pop the directory stack to return to the one saved with `pd`.

  ```console
  $ popd
  ~/super-bash-bros/shell/aliases/images

  $ pwd
  /Users/me/super-bash-bros/shell/aliases/images
  ```

### `typos`

Common typos, so that the computer will do what I'm thinking, even when I'm
not saying it.

* `gti`: _Aliased to `git`_.

* `pdw`: _Aliased to `pwd`_.
