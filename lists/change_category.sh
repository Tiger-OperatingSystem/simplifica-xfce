# Trechos de script que trocam a categoria do aplicativo

#----- Esse trecho troca a categoria do arquivo synaptic.desktop para Configurações ----#

 sed -i 's|^Categories=.*|Categories=Settings;X-XFCE-SettingsDialog;X-XFCE-SystemSettings;|g' synaptic.desktop
 
#----- Fim do trecho relacionado ao arquivo synaptic.desktop ----#
 
 
