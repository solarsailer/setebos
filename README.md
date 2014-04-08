Setebos
=======

Setebos is a dead-simple tool to configure a server.

## How to use?

Write a simple YAML file (preferably called `.setebos`):

```yaml
# Destination server.
server:
  host: ip or name
  user: username # optional, default to root
  password: password # optional

# Execute a list of scripts in the same order as below.
scripts:
  - script1
  - script2
  - etc.

# Copy these files to the server.
files:
  - from: path/to/file1.sh
    to: dest/for/
  - from: path/to/find/file2.rb
    to: dest
  - from: etc.
    to: etc.
```

Then, call setebos:

```bash
setebos run '/path/to/config/file'
```

## Development

```bash
# Run the launcher.
bundle exec bin/setebos

# Run the tests.
bundle exec rake test
```

Alternatively:

```bash
export RUBYLIB=lib
bin/setebos
```

## Future

* Glob file with special path (e.g. `~/`).
* Support port in the `server` section.
* Look for a `.setebos` file automatically when not provided with the `run` command.
* Support user generation in a new `users` section.
* Support for configuration files edition in a dedicated section.
* Create boilerplate `.setebos` file with `setebos init`.

## Inspiration

Inspired by [Fucking Shell Scripts](http://fuckingshellscripts.org/).
