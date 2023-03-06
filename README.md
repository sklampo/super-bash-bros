# ![Super Bash Bros.](https://fontmeme.com/permalink/201217/e68d3b06f41faa862312491460b69d7e.png)

This is a collection of shell utilities built as [aliases] and [functions] to
aid in software development, primarily targeted for MacOS.

The utilities are documented in detail in their respective directories,
[aliases] and [functions].

## Compatability

The collection is 100% compatible with Bash and almost 100% compatible with
[Z shell].

## Installation

### One-liner Installation

<!-- markdownlint-disable MD013 -->

```sh
curl -sS https://raw.githubusercontent.com/sklampo/super-bash-bros/master/install.sh | bash
```

<!-- markdownlint-enable MD013 -->

### Piece-wise Installation

1. Clone this project into `~/.super-bash-bros` (or another directory of your choosing).

 ```sh
git clone git@github.com:sklampo/super-bash-bros.git ~/.super-bash-bros
```

1. Source this project index from your profile

#### Bash

  ```bash
cat <<'EOF' >> ~/.bash_profile
test -e "${HOME}/.super-bash-bros/shell/index.sh" && source "${HOME}/.super-bash-bros/shell/index.sh"
EOF
```

#### Z shell

  ```zsh
cat <<'EOF' >> ~/.zprofile
test -e "${HOME}/.super-bash-bros/shell/index.sh" && source "${HOME}/.super-bash-bros/shell/index.sh"
EOF
```

## Organization

Key files in project:

```console
├── README.md
└── shell
    ├── aliases
    ├── functions
    │   ├── index.sh
    ├── index.sh
    └── lib
        └── core.sh
```

## Recommended

The following utilities are a fine additon to one's command line toolkit and
can be installed via `brew install`.  None are required by any
code in this repo.

* `tree`
* `watch`
* `wget`
* `xz`

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md).

This repo consists entirely of shell and Markdown files.  Shell files are
checked by the [ShellCheck](https://github.com/koalaman/shellcheck) tool.
Markdown files are linted using [markdownlint](https://github.com/DavidAnson/markdownlint).

A Github Action is configured that uses
[Super-Linter](https://github.com/github/super-linter), to provide automatic
linting on each pull request.

[aliases]: shell/aliases#aliases
[functions]: shell/functions#functions
[Z shell]: https://github.com/sklampo/super-bash-bros/issues?q=is%3Aopen+label%3Azsh+label%3Abug
