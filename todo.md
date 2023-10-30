# Installation de ueberzug

Il faut d'abord installer python 3.8

~~~bash
sudo add-apt-repository ppa:deadsnakes/pp
sudo apt update
sudo apt install python3.8
sudo python3.8 -m pip install ueberzug #Il peut y avoir des problème, dans ces cas la il faut désinstaller python3-pip et faire :
sudo python3 -m easy_install pip
sudo python3.8 -m easy_install pip
#si erreur il faut supprimer la lib qui pose problème est la réinstaller pour python 3.8 et 3.
#erreur si python3-xlib  existe :
sudo dpkg -r --force-depends python3-xlib
python3 -m pip install Xlib
python3.8 -m pip install Xlib
~~~

# rclone

récupérer rclone via le site weg rclone.org

# Theming Qt

# Theme gtk

# Installation de Kvantum 

```
sudo apt install kvantum
```

Ensuite il faut installer le thème Kvantum de nordic puis le mettre en place.


# Icones


# A FAIRE 

- [ ] ajouter les snippets .config/coc/ultisnips dans les dotfiles ou changer
  dossier pour un truc mieux
- [x] aligner le offset avec bufferlines
- [ ] Tester treesitter (higlighting + plusieurs petits trucs sympa)
  - [ ] soit treesitter via le plugin nvim soit par coc-sitter
- [ ] lister ici les différents lien vers les plugins a essayer
- [ ] Tester easy motion et incsearch
- [ ] changer nerdtree contre coc nvim ou nvim tree (lien a récupérer)
- [ ] essayer neorg
- [ ] enlever vimwiki de ses mort
- [x] highlight group de buffer line
- [x] Tester nvim-notify
  - [ ] décider de si on garde ou pas -> a garder pour plus tard
- [ ] Tester sniprun (qui permet de faire plus ou moins du repl)
- [ ] changer d'installateur de module (passer pour du lua ?)
- [ ] inch'hallah Tester neovide pour plus de fun
- [x] Tester fzf ou telescope (checker l'integration des liste Coc)
  - Ce sera du télescope hein
- [ ] Faire du keymapping plus intelligent (sort everything + documentation which key ? au moins pour les fonctions perso)
  - [ ] clever way to delete a mapping (which_key_ignore at least)
