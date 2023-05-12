# Lançadores de aplicativos que devem ter o nome definidos manualmente

sed -i "/^Name\[/d;s|^Name=.*|Name=Planilha (Excel)|g" planmaker-free21.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Slides (Power Point)|g" presentations-free21.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Texto (Word)|g" textmaker-free21.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Gerenciador de servidores|g" gigolo.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Planilha (Excel)|g" wps-office-et.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Apresentação de Slides (Power Point)|g" wps-office-wpp.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Editor de Texto (Word)|g" wps-office-prometheus.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Instalar Programas|g" io.elementary.appcenter.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Comparador de Arquivos|g" org.gnome.meld.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Player multimídia|g" org.xfce.Parole.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Visualizador de documentos|g" atril.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Som|g" pavucontrol.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Bloco de notas|g" org.xfce.mousepad.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Gerenciador de partições|g" gparted.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Backup|g" timeshift-gtk.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Terminal Tilix|g" xfce4-terminal-emulator.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Visualizador de Imagens|g" org.xfce.ristretto.desktop
