# ~/.config folder

I use nvim to code and this is my environment configuration as code

## Dependencies and notes

- Wezterm as terminal emulator
- oh-my-zsh
- Nerdfonts
- Gruvbox darker for terminal and gruvbox for nvim
- Zsh plugins -> plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
- Telescope -> install ripgrep

### Brew
```bash
~/code brew list
==> Formulae
ansible                 cryptography            gnu-tar                 jfrog-cli               libksba                 libvterm                nettle                  pinentry                python-markupsafe       sqlite                  turbolift
argocd                  delve                   gnupg                   jq                      liblinear               libyaml                 nmap                    pinentry-mac            python-packaging        starship                unbound
aws-iam-authenticator   eksctl                  gnutls                  k9s                     libnghttp2              lua                     node                    pnpm                    python-pyparsing        stress                  unibilium
black                   exercism                go                      kubernetes-cli          libssh2                 luajit                  npth                    pure                    python-pytz             stylua                  unzip
brotli                  fnm                     grep                    lazygit                 libtasn1                luv                     oniguruma               pycparser               python-setuptools       terraform               utf8proc
c-ares                  fzf                     helm                    libassuan               libtermkey              m4                      openldap                python-certifi          python@3.12             tfenv                   wget
ca-certificates         gettext                 hugo                    libevent                libtool                 mpdecimal               openssl@3               python-cryptography     pyyaml                  ticker                  xz
certifi                 gh                      icu4c                   libgcrypt               libunistring            msgpack                 p11-kit                 python-dateutil         readline                tmux                    yarn
cffi                    git                     iproute2mac             libgpg-error            libusb                  ncurses                 pcre                    python-jinja            ripgrep                 tree                    yq
cfssl                   gmp                     isort                   libidn2                 libuv                   neovim                  pcre2                   python-lxml             six                     tree-sitter             zsh-async

==> Casks
docker                          font-caskaydia-cove-nerd-font   font-hack-nerd-font             font-ubuntu-nerd-font           git-credential-manager          wezterm-nightly
```

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
