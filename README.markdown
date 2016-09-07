# Bitbar Plugin for Thyme

## Install

Assuming `~/.bitbar` is your plugins folder:

```
cp contrib/thyme.1s.sh ~/.bitbar/
```

It seems necessary to have the `.sh` extension in order to make bitbar pick up the auto-refresh interval.

## Development

The script in `contrib` is made for use with chruby, and it calls the actually installed gem's `bin` script as part of that. Feel free to change it in order to make it fit your environment.
