Installation de ueberzug
--

Il faut d'abord installer python 3.8
```
sudo add-apt-repository ppa:deadsnakes/pp
sudo apt update
sudo apt install python3.8
sudo python3.8 -m install ueberzug #Il peut y avoir des problème, dans ces cas la il faut désinstaller python3-pip et faire :
sudo python3 -m easy_install pip
sudo python3.8 -m easy_install pip
#si erreur il faut supprimer la lib qui pose problème est la réinstaller pour python 3.8 et 3.
#erreur si python3-xlib  existe :
sudo dpkg -r --force-depends python3-xlib
python3 -m pip install Xlib
python3.8 -m pip install Xlib
```

Theming Qt
--

Theme gtk
---

Installation de Kvantum 
```
sudo apt install kvantum
```

Ensuite il faut installer le thème Kvantum de nordic puis le mettre en place.


Icones
---


