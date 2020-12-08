# Super Bash Bros

This is a collection of shell utilities built as aliases and functions to
aid in software development.

It is 100% compatible with Bash and almost 100% compatible with Z shell.

## Installation

### One-liner Installation

(Does not exist)

```sh

```

### Piece-wise Installation

1. Clone this project into `~/.super_bash_bros` (or another directory of your choosing).

 ```sh
git clone git@github.com:sklampo/shell.git ~/.super_bash_bros
```

2. Source this project index from your profile

 #### Bash

 **NOTE THE DOUBLE `>> ~.bash_profile` !**

 ```
cat <<'EOF' >> ~/.bash_profile
test -e "${HOME}/.super_bash_bros/bash/index.sh" && source "${HOME}/.super_bash_bros/bash/index.sh"
EOF
```

 #### Z shell

 **NOTE THE DOUBLE `>> ~.zprofile` !**

 ```
cat <<'EOF' >> ~/.zprofile
test -e "${HOME}/.super_bash_bros/bash/index.sh" && source "${HOME}/.super_bash_bros/bash/index.sh"
EOF
```


## Organization

```console
├── LICENSE
├── README.md
└── bash
    ├── aliases
    ├── functions
    │   ├── index.sh
    ├── index.sh
    └── lib
        └── core.sh
```

## Recommended

The following utilities are highly-recommended and can be installed via `brew install <utility>`.

* `tree`
* `watch`
* `wget`
* `xz`

## Contributing

See `CONTRIBUTING.md` (does not exist yet).

This repo consists entirely of shell and Markdown files.  Shell files are
checked by the [ShellCheck](https://github.com/koalaman/shellcheck) tool.
Markdown files are linted using [markdownlint](https://github.com/DavidAnson/markdownlint).

A Github Action is configured that uses
[Super-Linter](https://github.com/github/super-linter), to provide automatic
linting on each pull request.
