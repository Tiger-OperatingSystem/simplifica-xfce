# Lançadores de aplicativos que devem ter o nome definidos manualmente

sed "/^Name\[/d;s|^Name=.*|Name=Planilha (Excel)|g" planmaker-free21.desktop
sed "/^Name\[/d;s|^Name=.*|Name=Slides (Power Point)|g" presentations-free21.desktop
sed "/^Name\[/d;s|^Name=.*|Name=Texto (Word)|g" textmaker-free21.desktop
