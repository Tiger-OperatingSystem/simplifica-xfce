# Lançadores cujo campo "Name" deve ser trocado pelo campo "GenericName"
launchers_to_swap+=("mousepad.desktop")
launchers_to_swap+=("atril.desktop")
launchers_to_swap+=("thunar.desktop")
launchers_to_swap+=("gparted.desktop")
sed "/^Name\[/d;s|^Name=.*|Name=Gerenciador de servidores|g" gigolo.desktop
