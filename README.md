## Modo de usar
### Para criar um atalho: 
    nd  -a <atalho> <diretorio>
### Para deletar um atalho: 
    nd -d <atalho>
### Para listar os atalhos:
    nd -l
### Para ajuda:
    nd -h
### Para acessar atalho:
    nd <atalho>
## Instalando:

### Para a instalação é necessário clonar o repositório (necessita a presença da ferramenta git):
    git clone <repo> <localDeDownload>/ndir
#### Dar permissão de escrita
    sudo chmod +x <localDeDownload>/ndir.sh
### E por fim criar um alias no arquivo de configuração do seu shell ("~/.zshrc", ".~/bashrc", entre outros):
    alias nd=". <localDeDownload>/.ndir.sh"
    

