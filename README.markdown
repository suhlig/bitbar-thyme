# Bitbar Plugin for Thyme

## Install

```
cd ~/.bitbar # or wherever your bitbar plugin folder is
ln -s $(which bitbar-thyme) bitbar-thyme.1s
```

## Development

The script in `bin` is made for use with chruby, and it calls the actual Ruby script in `libexec` as part of that. Feel free to copy (instead of symlink) it in order to make it fit your environment.
