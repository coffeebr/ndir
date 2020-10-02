function listShortcuts() 
{
    awk '/^#/ {next} $1'  $dirConfig"shortcuts"  
}
function addShortcut() 
{
    grep -q $1 $dirConfig"shortcuts";
    if [ $? -ne 0 ] 
    then
        echo $1 " " $2 >> $dirConfig"shortcuts";
    else
        echo "Shortcut já existe!"
    fi
}
function deleleteShortcut()
{
    #echo $(awk '/^'$1'/ {next} $1 '  $dirConfig"shortcuts") > $dirConfig"shortcuts"
    var=$(awk '{ if($1 != '$1') print $0;}'  $dirConfig"shortcuts");
    echo "$var" > $dirConfig"shortcuts"
}
function gotoShortcut() 
{
    shortcut=$(awk -F " " '/'$1'/ {print $2;}'  $dirConfig"shortcuts");
    cd $shortcut;
}
function check()
{
    if [ ! -d $dirConfig ]
    then 
        mkdir  $dirConfig
    fi
    if [ ! -s $dirConfig"shortcuts" ]
    then 
        echo "#Arquivo de atalhos" > $dirConfig"shortcuts";
    fi
}
help()
{
    echo "help";
}

dirConfig=$HOME"/.config/ndir/"

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
    *) 
        gotoShortcut $1;
    ;;
esac