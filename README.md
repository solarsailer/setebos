Homing
======

For dev:

```shell
export RUBYLIB=lib
bin/homing
```

# How to use?

Write a simple YAML file called `Homingfile`:

```yaml
server:
  host: ip or name
  user: username # optional, default to root
  password: password # optional

# Execute a list of scripts in the same order as below.
scripts:
  - script1
  - script2
  - etc.

# Files to move to the server.
files:
  - from: path/to/file1.sh
    to: dest/for/
  - from: path/to/find/file2.rb
    to: dest
  - from: etc.
    to: etc.

# Edit configuration files.
confs:
  - file: name
    add: line to add
    replace: line to replace # (if the line start by the value, replace the whole line)
```

Then, call homing:

```shell
homing # Look for an Homingfile.
```

Alternatively, you can use:

```shell
homing --scripts # execute the scripts
homing --files   # send the files
homing --confs   # edit the confs
```

# Inspiration

Inspired by [Fucking Shell Scripts](http://fuckingshellscripts.org/).
