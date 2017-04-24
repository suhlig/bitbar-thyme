# Bitbar + Thyme Integration

This gem shows the current [Thyme](https://github.com/hughbien/thyme) status in [Bitbar](https://getbitbar.com/). It consists of two parts:

1. A plugin for Thyme that, on every tick, writes the status to a file, and
1. a plugin for Bitbar that reads that file and renders the status in the Bitbar instance.

# Installation

## Install the gem

```
gem install bitbar-thyme
```

## Configure Thyme

Enable the bitbar plugin in `~/.thymerc`:

```
begin
  require 'thyme/bitbar_plugin'
  use Thyme::BitbarPlugin
rescue LoadError
  warn 'Warning: Could not load the bitbar plugin; try "gem install bitbar_thyme".'
end
```

## Configure Bitbar

Assuming `~/.bitbar` is your plugins folder, the gem installer will create `~/.bitbar/thyme.1s.sh`.
