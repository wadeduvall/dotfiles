function net_listening --wraps='sudo lsof -i -n | grep LISTEN' --description 'alias net_listening sudo lsof -i -n | grep LISTEN'
  sudo lsof -i -n | grep LISTEN $argv
        
end
