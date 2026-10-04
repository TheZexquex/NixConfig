fzf --ansi --disabled --query "" \
  --bind "start:reload(rg --column --line-number --no-heading --color=always --type nix {q} ~/nix || true)" \
  --bind "change:reload(rg --column --line-number --no-heading --color=always --type nix {q} ~/nix || true)" \
  --delimiter : \
  --preview 'bat --color=always --highlight-line {2} {1}' \
  --preview-window '+{2}-/2' \
  --bind 'enter:become(nvim +{2} {1})'
