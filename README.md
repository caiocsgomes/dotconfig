# ~/.config folder

My developer environment configuration and my notes

## Dependencies and notes

- Wezterm as terminal emulator
- oh-my-zsh
- Nerdfonts
- Gruvbox darker for terminal and gruvbox for nvim
- Zsh plugins -> plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
- Telescope -> install ripgrep

## Scripts

```bash
## ~/.zshrc --> Add this to ~/.zshrc to make the file in this config the main configuration
if [ -r ~/.config/.zshrc ]; then
    source ~/.config/.zshrc
fi
```

## Sources

- https://neovim.io/doc/user/lua-guide.html#lua-guide


## Troubleshooting

:checkhealth
:messages

## Todo

- Fix python dap
- Add todo plugin
