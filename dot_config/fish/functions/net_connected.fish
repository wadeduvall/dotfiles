function net_connected --wraps='sudo lsof -i -n | grep -v LISTEN' --description 'alias net_connected sudo lsof -i -n | grep -v LISTEN'
  sudo lsof -i -n | grep -v LISTEN $argv
        
end
