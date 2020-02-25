alias gitlog='git log --oneline --graph --decorate --all --topo-order'
list_source(){ 
	clear && la $1 | grep cpp --color=never && echo "---------------" && la $1 | grep h --color=never
}
