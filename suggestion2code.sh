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
    script="sed \"/^Name\[/d;s|^Name=.*|Name=${name}|g\" ${desktop}"
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



  script="

#----- Esse trecho adiciona '${argumentos}' $(echo ${_local} | tr  '[:upper:]' '[:lower:]') no arquivo ${desktop} ----#

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


  script="${script}sed -i \"\${line}s|^Exec=|Exec=\${command} \${parameters}|g\" ${desktop}

#----- Fim do trecho relacionado ao arquivo ${desktop} ----#

"



  echo -e "@daigoasuka sugestão para adicionar \`${argumentos}\` $(echo ${_local} | tr  '[:upper:]' '[:lower:]') no lançador \`${desktop}\`, esse é o código:\n\n"'```'"bash\n${script}\n"'```'  > commit.md
}

[ "${color}" = "7057ff" ] && type:1
[ "${color}" = "d876e3" ] && type:2

gh issue comment "${ISSUE_URL}" --body-file commit.md
