# Lançadores de aplicativos que devem ter o nome definidos manualmente

sed -i "/^Name\[/d;s|^Name=.*|Name=Planilha (Excel)|g" planmaker-free21.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Slides (Power Point)|g" presentations-free21.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Texto (Word)|g" textmaker-free21.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Gerenciador de servidores|g" gigolo.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Planilha (Excel)|g" wps-office-et.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Apresentação de Slides (Power Point)|g" wps-office-wpp.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Editor de Texto (Word)|g" wps-office-prometheus.desktop
sed -i "/^Name\[/d;s|^Name=.*|Name=Instalar Programas|g" io.elementary.appcenter.desktop
