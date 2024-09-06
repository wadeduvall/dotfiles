function ls --wraps=eza --wraps='eza --icons --group-directories-first -F' --description 'alias ls eza --icons --group-directories-first -F'
  eza --icons --group-directories-first -F $argv
        
end
