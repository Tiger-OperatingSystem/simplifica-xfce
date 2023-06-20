# Trechos de script que trocam a categoria do aplicativo

#----- Esse trecho troca a categoria do arquivo synaptic.desktop para Configurações ----#

sed -i 's|^Categories=.*|Categories=System;|g' synaptic.desktop

sed -i 's|^Categories=.*|Categories=System;|g' boot-repair.desktop

#----- Fim do trecho relacionado ao arquivo synaptic.desktop ----#
 
#----- Esse trecho troca a categoria do arquivo atril.desktop para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' atril.desktop
 
 #----- Fim do trecho relacionado ao arquivo atril.desktop ----#
 
 #----- Esse trecho troca a categoria do arquivo org.gnome.meld.desktop para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' org.gnome.meld.desktop
 
 #----- Fim do trecho relacionado ao arquivo org.gnome.meld.desktop ----#
 
#----- Esse trecho troca a categoria do arquivo org.gnome.baobab.desktop para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' org.gnome.baobab.desktop
 
 #----- Fim do trecho relacionado ao arquivo org.gnome.baobab.desktop ----#
 
#----- Esse trecho troca a categoria do arquivo org.xfce.ristretto.desktop para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' org.xfce.ristretto.desktop
 
#----- Fim do trecho relacionado ao arquivo org.xfce.ristretto.desktop ----#
 
#----- Esse trecho troca a categoria do arquivo welcome-tigeros para Acessórios ----#

 sed -i 's|^Categories=.*|Categories=Utility;|g' welcome-tigeros.desktop
 
 #----- Fim do trecho relacionado ao arquivo welcome-tigeros ----#

  sed -i 's|^Categories=.*|Categories=System;|g' xfce4-terminal-emulator.desktop
