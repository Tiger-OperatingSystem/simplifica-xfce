# Trechos de script que modificam a execução do aplicativo

#----- Esse trecho adiciona '--password-store=basic' como primeiro parametro no arquivo google-chrome.desktop ----#

line=$(cat google-chrome.desktop | grep -n -A 10000 -E '^\[Desktop Entry]|^Exec=' | grep -m1 Exec= | cut -d\: -f1)

command_line=$(sed -n ${line}p google-chrome.desktop  | cut -c 6- | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//')

parameters=$(echo ${command_line} | sed 's/[^ ]* //')
command=$(echo ${command_line} | sed 's|[[:space:]].*||g')

parameters="--password-store=basic ${parameters}"
  
sed -i "${line}s|^Exec=.*|Exec=${command} ${parameters}|g" google-chrome.desktop

#----- Fim do trecho relacionado ao arquivo google-chrome.desktop ----#

#----- Esse trecho define 'tilix'  como emulador de terminal padrão ----#

sed -i "${line}s|^Exec=.*|Exec=tilix|g" xfce4-terminal-emulator.desktop

#----- Fim do trecho relacionado ao arquivo xfce4-terminal-emulator.desktop ----#
