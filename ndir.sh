dirConfig=$HOME"/.config/ndir/"

function listShortcuts() {
    awk '/^#/ {next} $1' $dirConfig"shortcuts"
}
function addShortcut() {
    shortcut=$(awk -F " " '/'$1'/ {print '1'}' $dirConfig"shortcuts")
    if [ -z $shortcut ]; then
        if [ -d $2 ]; then
            echo $1 " " $2 >>$dirConfig"shortcuts"
        else
            echo -n "Diretório não existe, tem certeza que deseja criar o atalho [s/n]: "
            read shortcut
            if [ $shortcut = "s" ]; then
                echo $1 " " $2 >>$dirConfig"shortcuts"
            fi
        fi
    else
        echo "Shortcut já existe!"
    fi
}

function deleleteShortcut() {
    file=$(awk '{ if($1 != "'$1'") print $0 }' $dirConfig"shortcuts")
    echo -e $file >$dirConfig"shortcuts"
}

function gotoShortcut() {
    shortcut=($(awk -F " " '/'$1'/ {print $0}' $dirConfig"shortcuts"))

    for i in $(seq 3 ${#shortcut[@]}); do
        shortcut[2]=$shortcut[2]" "$shortcut[$i]
    done

    if [ -d $shortcut[2] ]; then
        cd $shortcut[2]
    else
        echo "o diretório "$shortcut[2]" do atalho "$shortcut[1]" não foi encontrado, caso deseje apaga o atalho digite: nd -r "$shortcuts
    fi
}
function check() {
    if [ ! -d $dirConfig ]; then
        mkdir $dirConfig
    fi
    if [ ! -s $dirConfig"shortcuts" ]; then
        echo "#Arquivo de atalhos" >$dirConfig"shortcuts"
    fi
}
help() {
    echo "  Uso: nd <opção> [...]\n\n" \
        \
        "Navegação em diretórios por meio de atalhos.\n\n" \
        \
        "Argumentos:\n\n" \
        \
        "-a) Criar um novo atalho: nd -a <atalho> <diretório>\n" \
        "-d) Deletar um atalho: nd -d <atalho>\n" \
        "-l) Listar atalhos salvos: nd -l\n" \
        "-h) Mostrar está pagina de ajuda: nd -h\n\n" \
        \
        "Para mais informações acessar o github: <https://github.com/emanuel-alves/ndir.git>"
}

if [ $# -eq 0 ] 
then
    help
    return 1;
fi

check;

case "$1" in
    "-a") 
        addShortcut $2 $3;
    ;;
    "-l") 
        listShortcuts
    ;;
    "-d") 
        deleleteShortcut $2
    ;;
    "-h")
        help;
    ;;
    *) 
        gotoShortcut $1;
    ;;
esac

