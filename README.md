## Sobre:
### Este pequeno script foi criado apenas para aprendizado pessoal em shell script e para facilitar na locomoção em diretórios que acesso com frequência.

## Modo de usar
### Para criar um atalho: 
    nd -a <atalho> <diretório>
### Para deletar um atalho: 
    nd -d <atalho>
### Para listar os atalhos:
    nd -l
### Para exibir ajuda:
    nd -h
### Para acessar atalho:
    nd <atalho>
## Instalando:

### Para a instalação é necessário clonar o repositório (necessita a presença da ferramenta git):
    git clone https://github.com/emanuel-alves/ndir.git <diretório>/ndir
#### Dar permissão de escrita
    sudo chmod +x <diretório>/ndir.sh
### E por fim criar um alias no arquivo de configuração do seu shell ("~/.zshrc", ".~/bashrc", entre outros):
    alias nd=". <localDeDownload>/.ndir.sh"
#### O uso do "." no início do alias é necessário para que seja possível a mudança de diretório no shell principal. Outra opção é usando o source:
    alias nd=". <localDeDownload>/.ndir.sh"
