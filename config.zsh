# 同じコマンドを履歴に残さない
setopt hist_ignore_all_dups
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# ビープ音を鳴らさない
setopt no_beep

# 頭のユーザー名を非表示
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  fi
}
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%c'
}