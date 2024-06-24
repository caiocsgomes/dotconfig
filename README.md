# ~/.config folder

I use nvim to code and this is my environment configuration as code

## Dependencies and notes

- Wezterm as terminal emulator
- oh-my-zsh
- Nerdfonts
- Gruvbox darker for terminal and gruvbox for nvim
- Zsh plugins -> plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
- Telescope -> install ripgrep

## Scripts

```bash
## ~/.zshrc
if [ -r ~/.config/.zshrc ]; then
    source ~/.config/.zshrc
fi
```

## Sources

- https://neovim.io/doc/user/lua-guide.html#lua-guide
