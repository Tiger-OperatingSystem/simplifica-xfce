#!/usr/bin/bash

function field() {
  local line=$(echo "${1}*4-1" | bc)
  echo "${issue}" | sed -n "${line}p"
}

author=$(gh issue view "${ISSUE_URL}" --json author | cut -d\" -f6)
issue=$(echo -e $(gh issue view "${ISSUE_URL}" --json body | cut -d\" -f4))
color=$(gh issue view "${ISSUE_URL}" --json labels | cut -d\" -f 18)

function type:1(){
  desktop=$(field 1)
  patch=$(field   2)
  name=$(field    3)
  file_to_modify=""

  [ "${patch}" = "Usar o tipo de aplicação como nome" ] && {
    script="launchers_to_swap+=(\"${desktop}\")"
    file_to_modify="lists/change_Name_to_GenericName.sh"
  }

  [ "${patch}" = "Usar o nome genérico (tipo de aplicação) como nome" ] && {
    script="launchers_to_swap+=(\"${desktop}\")"
    file_to_modify="lists/change_Name_to_GenericName.sh"
  }

  [ "${patch}" = "Ocultar o aplicativo" ] && {
    script="launchers_to_hide+=(\"${desktop}\")"
    file_to_modify="lists/launchers_to_hide.sh"
  }

  [ "${patch}" = "Exibir o aplicativo" ] && {
    script="launchers_to_show+=(\"${desktop}\")"
    file_to_modify="lists/launchers_to_show.sh"
  }

  [ "${patch}" = "Definir um nome manualmente" ] && {
    script="sed -i \"/^Name\[/d;s|^Name=.*|Name=${name}|g\" ${desktop}"
    file_to_modify="lists/launchers_to_manually_rename.sh"
  }

  [ "${patch}" = "Retirar o aplicativo do painel de controle" ] && {
    script="launchers_to_reset+=(\"${desktop}\")"
    file_to_modify="lists/launchers_to_move_back_to_usr_share.sh"
  }
  
  echo -e "@daigoasuka, o usuário @${author} está sugerindo para **$(echo ${patch} | tr  '[:upper:]' '[:lower:]')** para o arquivo \`${desktop}\`, esse é o código:\n\n"'```'"bash\n${script}\n"'```'"\n\nEle deve ser colocado ao final do arquivo "'`'${file_to_modify}'`' > commit.md
}

function type:2(){
  desktop=$(field 1)
  _local=$(field   2)
  argumentos=$(field    3)

  script="#----- Esse trecho adiciona '${argumentos}' $(echo ${_local} | tr  '[:upper:]' '[:lower:]') no arquivo ${desktop} ----#

line=\$(cat ${desktop} | grep -n -A 10000 -E '^\[Desktop Entry]|^Exec=' | grep -m1 Exec= | cut -d\: -f1)

command_line=\$(sed -n \${line}p ${desktop}  | cut -c 6- | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//')

parameters=\$(echo \${command_line} | sed 's/[^ ]* //')
command=\$(echo \${command_line} | sed 's|[[:space:]].*||g')

"

  [ "${_local}" = "Como primeiro parametro" ] && {
  script="${script}parameters=\"${argumentos} \${parameters}\"
  
"
  } 

  [ "${_local}" = "Como último parametro" ] && {
  script="${script}parameters=\"\${parameters} ${argumentos}\"
  
"
  }

  [ "${_local}" = "Antes do comando" ] && {
  script="${script}command=\"${argumentos} \${command}\"
  
"
  }

  script="${script}sed -i \"\${line}s|^Exec=.*|Exec=\${command} \${parameters}|g\" ${desktop}

#----- Fim do trecho relacionado ao arquivo ${desktop} ----#
"
  echo -e "@daigoasuka sugestão para adicionar \`${argumentos}\` $(echo ${_local} | tr  '[:upper:]' '[:lower:]') no lançador \`${desktop}\`, esse é o código:\n\n"'```'"bash\n${script}\n"'```'"\n\nEle deve ser colocado ao final do arquivo "'`'lists/modify_execution_environment.sh'`'  > commit.md
}

function type:3(){
  desktop=$(field 1)
  category=$(field   2)
  control_panel_category=$(field    3)
  
  human_category="${category}"

  [ "${category}" = "Acessórios" ] && {
    category="Utility;"
  }
        
  [ "${category}" = "Configurações" ] && {
    category="Settings;"
  }
  
  [ "${category}" = "Desenvolvimento" ] && {
    category="Development;"
  }
       
  [ "${category}" = "Escritório" ] && {
    category="Office;"
  }

  [ "${category}" = "Gráficos" ] && {
    category="Graphics;"
  }
    
  [ "${category}" = "Internet" ] && {
    category="Network;"
  }
  
  [ "${category}" = "Aúdio" ] && {
    category="Audio;"
  }
       
  [ "${category}" = "Sistema" ] && {
    category="System;"
  }
        
  [ "${control_panel_category}" = "Pessoal" ] && {
    category="${category}X-XFCE-SettingsDialog;X-XFCE-PersonalSettings;"
  }
  
  [ "${control_panel_category}" = "Hardware" ] && {
    category="${category}X-XFCE-SettingsDialog;X-XFCE-HardwareSettings;"
  }
  
  [ "${control_panel_category}" = "Sistema" ] && {
    category="${category}X-XFCE-SettingsDialog;X-XFCE-SystemSettings;"
  }

  [ "${control_panel_category}" = "Outros" ] && {
    category="${category}X-XFCE-SettingsDialog;"
  }
  
  script="#----- Esse trecho troca a categoria do arquivo ${desktop} para ${human_category} ----#

 sed -i 's|^Categories=.*|Categories=${category}|g' ${desktop}
 
 #----- Fim do trecho relacionado ao arquivo ${desktop} ----#
 "
 
  echo -e "@daigoasuka sugestão para mudar a categoria do lançador \`${desktop}\` para \`${human_category}\`, esse é o código:\n\n"'```'"bash\n${script}\n"'```'"\n\nEle deve ser colocado ao final do arquivo "'`'lists/change_category.sh'`'  > commit.md

}

function type:4(){
  desktop=$(field 1)
  icon=$(field    2)
  
    script="#----- Esse trecho troca ao ícone do arquivo ${desktop} para ${icon} ----#

 sed -i 's|^Icon=.*|Icon=${icon}|g' ${desktop}
 
 #----- Fim do trecho relacionado ao arquivo ${desktop} ----#
 "
 
  echo -e "@daigoasuka sugestão para mudar o ícone do lançador \`${desktop}\` para \`${icon}\`, esse é o código:\n\n"'```'"bash\n${script}\n"'```'"\n\nEle deve ser colocado ao final do arquivo "'`'lists/change_icon.sh'`'  > commit.md

}

[ "${color}" = "7057ff" ] && type:1
[ "${color}" = "d876e3" ] && type:2
[ "${color}" = "a2eeef" ] && type:3
[ "${color}" = "fbca04" ] && type:4

gh issue comment "${ISSUE_URL}" --body-file commit.md
