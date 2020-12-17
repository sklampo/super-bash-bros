# Functions

## Purpose

Operations too complicated to express as an `alias` have been written as
functions.  Each function is defined in a file matching the name of the
function.

### Summary
* [docker-cli](#docker-cli)
* [free](#free)
* [git-add-modified](#git-add-modified)
* [git-set-upstream-branch](#git-set-upstream-branch)
* [post-date-vcr-token-expires-at](#post-date-vcr-token-expires-at)
* [slugify](#slugify)
* [tac](#tac)

## Individual Functions
<!-- markdownlint-disable MD036 -->

### `docker-cli`

Start a Bash shell in the container whose name is provided.

**SYNOPSIS**

`docker-cli <container_name>`

**DESCRIPTION**

Starts a Bash shell in the running container name (not ID) provided.

This is an abstraction of the `docker exec -it <container_id> /bin/bash`
command, allowing one to specify the container name, thus avoiding a
lookup of the container ID.

**EXIT STATUS**

The `docker-cli` utility exits with the status code of the Docker command when
it successfully connects to the running container and 1 when an error occurs.

**EXAMPLE**

Given an application with a running container named `stop-hammer-time`, the
command:

```bash
docker-cli stop-hammer-time
```

will look up the ID for this container by name and attempt to run `/bin/bash`
in that container, printing this output:

<!-- markdownlint-disable MD013 -->
```console
Attaching to Docker container stop-hammer-time with command: docker exec -it 25f025f025f0 /bin/bash
```
<!-- markdownlint-enable MD013 -->

### `free`

Display memory statistics

**SYNOPSIS**

`free`

**DESCRIPTION**

Display amount of free and used memory in the system.  This utilizes the
MacOS `vm_stat` command and formats it into a less-cryptic format.

**EXAMPLE**

```console
$ free
free:                      104.39 Mi
active:                   5173.54 Mi
inactive:                 5164.84 Mi
speculative:                 5.26 Mi
throttled:                   0.00 Mi
wired down:               5830.80 Mi
purgeable:                 442.45 Mi
copy-on-write:         4477381.42 Mi
zero filled:          38270650.36 Mi
reactivated:           1613707.82 Mi
purged:                 729443.88 Mi
stored in compressor:         25122.75 Mi
occupied by compressor:           103.28 Mi
```

### `git-add-modified`

Run `git add` on all tracked files that have been modified.

**SYNOPSIS**

`git-add-modified`

**DESCRIPTION**

Performs a `git add` operation on all *tracked* files with a status of
`modified`.

This is useful when your working directory contains a number of untracked
files you do not wish check in, where running `git add file1 file2 ...` is
not desired.

**EXIT STATUS**

The `git-add-modified` utility exits with the status code of the underlying
`git add` operation.

**EXAMPLE**

Given project under Git control with a current status (i.e. `git status`) of:

```console
On branch HAMMER-0001
Your branch is up to date with 'origin/HAMMER-0001'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   package.json
  modified:   yarn.lock

Untracked files:
  (use "git add <file>..." to include in what will be committed)

  TODO
  FIXME
  scripts/create_hammer_pants.sql

no changes added to commit (use "git add" and/or "git commit -a")
```

Running the command:

```bash
docker-cli stop-hammer-time
```

updates the staged file index with `package.json` and `yarn.lock`, ignoring
the untracked files.

### `git-set-upstream-branch`

Sets your local branch to track the upstream on origin.

**SYNOPSIS**

`git-set-upstream-branch`

**DESCRIPTION**

The `git-set-upstream-branch` utility sets your local branch to track the
same branch on `origin` for its upstream.

**EXIT STATUS**

The `git-set-upstream-branch` utility exits with the status code of the
underlying `git branch` operation.

**EXAMPLE**

Simply run this command with any arguments.

```bash
git-set-upstream-branch
```

### `post-date-vcr-token-expires-at`

Sets the token expiration date to the [year 3000] for file(s) in specified path.

**SYNOPSIS**

`post-date-vcr-token-expires-at` path

**DESCRIPTION**

The `post-date-vcr-token-expires-at` utility searches the provide `path`,
setting each occurrence of `token_expires_at` to a value of 3000.  `path`
can be a single file or a directory to recurse through.

The use-case for this utility is updating [vcr] recordings.

**EXIT STATUS**

The `post-date-vcr-token-expires-at` utility exits with the status code of
1 when missing the required `path` parameter.

**EXAMPLE**

To update a single file:

```bash
post-date-vcr-token-expires-at spec/cassettes/VCR_example_group_metadata/records_an_http_request.yml
```

To update a suite of recordings:

```bash
post-date-vcr-token-expires-at spec/cassettes/VCR_example_group_metadata/
```

### `slugify`

Generates a "[slug](https://en.wikipedia.org/wiki/Clean_URL#Slug)" from a
string.

**SYNOPSIS**

`slugify "String to transform into a slug"`

**DESCRIPTION**

The `slugify` utility transforms a string into a lowercase string, with
whitespace characters replaced by hyphens and punctuation removed.  Non-
ASCII characters are also transliterated to the closest possible matching
character.

**EXIT STATUS**

The `slugify` utility exits with the status code of 0 when successful or a
code >0 if an error occurs.

**EXAMPLE**

Pass `slugify` a string.  _Note that following example uses strong quotes
(') so `!` is not interpreted by the shell._

Running the command:

```bash
slugify 'STOP!  Hammer-time!'
```

will produce:

```console
stop-hammer-time
```

### `tac`

Concatenate and print files in reverse

**SYNOPSIS**

`tac [FILE]`

**DESCRIPTION**

`tac`, or cat spelled backwards, writes FILE to standard output, last line
first. With no FILE, read standard input.  This is a simple version of the
standard GNU utility.  See
[tac man page](https://man7.org/linux/man-pages/man1/tac.1.html).

**EXIT STATUS**

The `tac` utility exits with the status code of 0 when successful or a
code >0 if an error occurs.

**EXAMPLES**

Generate a text file named `numbers.txt` for demonstration purposes:

```bash
for i in {0..10}; do echo $i; done > numbers.txt
```

Running the command:

```bash
tac numbers.txt
```

will output the file in reverse.

The following variations will yield the same results:

```bash
tac < numbers.txt
```

```bash
cat numbers.txt | tac
```

<!-- markdownlint-enable MD036 -->
[year 3000]: https://en.wikipedia.org/wiki/List_of_Late_Night_with_Conan_O%27Brien_sketches#In_the_Year_2000/3000
[vcr]: https://github.com/vcr/vcr
