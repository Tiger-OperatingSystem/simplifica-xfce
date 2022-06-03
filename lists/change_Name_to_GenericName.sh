# Lançadores cujo campo "Name" deve ser trocado pelo campo "GenericName"
launchers_to_swap+=("mousepad.desktop")
launchers_to_swap+=("atril.desktop")
launchers_to_swap+=("thunar.desktop")
launchers_to_swap+=("gparted.desktop")
sed "/^Name\[/d;s|^Name=.*|Name=Gerenciador de servidores|g" gigolo.desktop
sed "/^Name\[/d;s|^Name=.*|Name=Planilha (Excel)|g" planmaker-free21.desktop
sed "/^Name\[/d;s|^Name=.*|Name=Slides (Power Point)|g" presentations-free21.desktop
sed "/^Name\[/d;s|^Name=.*|Name=Texto (Word)|g" textmaker-free21.desktop
