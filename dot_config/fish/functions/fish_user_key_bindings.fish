function fish_user_key_bindings
    # Make ctr-space accept autosuggestion
    bind -M insert -k nul accept-autosuggestion
    # Unbind \eh from help
    bind --erase --preset -M insert \eh
    bind --erase --preset \eh
    bind --erase --preset -M visual \eh
    # bind alt-jkhl to arrow keys
    bind -M insert \ej down-line
    bind -M insert \ek up-line
    bind -M insert \eh backward-char
    bind -M insert \el forward-char
end
