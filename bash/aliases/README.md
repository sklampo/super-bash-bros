# Aliases

## Purpose

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
  
  ```console
  com.docke 10000 stephen.kirkpatrick   10u  IPv4 0x6d923c0b0000000      0t0  TCP 127.0.0.1:52387 (LISTEN)
  com.docke 10300 stephen.kirkpatrick   55u  IPv6 0x6d923c070000000      0t0  TCP *:3306 (LISTEN)
  ruby      30000 stephen.kirkpatrick    9u  IPv4 0x6d923c0b0000000      0t0  TCP *:3000 (LISTEN)
  node      30100 stephen.kirkpatrick   24u  IPv4 0x6d923c0b0000000      0t0  TCP *:3035 (LISTEN)
  ```
  
  **Linux reference**
  
  ```console
  $ netstat -nlt
  Active Internet connections (only servers)
  Proto Recv-Q Send-Q Local Address           Foreign Address         State
  tcp        0      0 127.0.0.11:44327        0.0.0.0:*               LISTEN
  tcp6       0      0 :::3306                 :::*                    LISTEN
  ```

* `systemctl`: A command used to administer `Systemd` services.  This alias
  simply maps to `brew services`.  Handy for someone used to working in
  `Systemd`-based systems.  An unnecessary abstraction for everyone else.
  
  **Usage**:
  
  ```bash
  systemctl start mysql@5.7
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
  
* `bundle_1.17.3`: Runs Bundler version 1.17.3
  
  **Usage**:
  
  ```bash
  bundle_1.17.3
  ```
  
### `ls`

TODO

### `typos`

TODO
