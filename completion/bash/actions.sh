complete -A hostname   ssh scp sftp ftp ping
complete -A user       su w

complete -A command    nohup exec eval trace gdb
complete -A command    command type which

complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function

complete -A helptopic  help
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%' fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory  -o default cd

# File compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip gzcat
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2 bzcat bzless

complete -f -o default -X '*.+(xz|XZ)'  xz
complete -f -o default -X '*.+(lzma|LZMA)'  lzma
complete -f -o default -X '!*.+(xz|XZ)'  unxz
complete -f -o default -X '!*.+(lzma|LZMA)'  unlzma
