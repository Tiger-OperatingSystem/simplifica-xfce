# Trechos de script que trocam a categoria do aplicativo

#----- Esse trecho troca a categoria do arquivo synaptic.desktop para Configurações ----#

 sed -i 's|^Categories=.*|Categories=Settings;X-XFCE-SettingsDialog;X-XFCE-SystemSettings;|g' synaptic.desktop

#----- Fim do trecho relacionado ao arquivo synaptic.desktop ----#
 
#----- Esse trecho troca a categoria do arquivo atril.desktop para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' atril.desktop
 
 #----- Fim do trecho relacionado ao arquivo atril.desktop ----#
 
 #----- Esse trecho troca a categoria do arquivo org.gnome.meld.desktop para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' org.gnome.meld.desktop
 
 #----- Fim do trecho relacionado ao arquivo org.gnome.meld.desktop ----#
 
