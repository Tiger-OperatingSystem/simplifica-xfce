#!/usr/bin/bash

function field() {
  local line=$(echo "${1}*4-1" | bc)
  echo "${issue}" | sed -n "${line}p"
}

author=$(gh issue view "${ISSUE_URL}" --json author | cut -d\" -f6)

issue=$(echo -e $(gh issue view "${ISSUE_URL}" --json body | cut -d\" -f4))

desktop=$(field 1)
patch=$(field   2)
name=$(field    3)
file_to_modify=""

[ "${patch}" = "Usar o tipo de aplicação como nome" ] && {
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
gh issue comment "${ISSUE_URL}" --body-file commit.md
