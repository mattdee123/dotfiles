if git rev-parse 2> /dev/null;
then
    files=`(git ls-files .[^.]*)`;
else
    files=`ls .[^.]*`;
fi;

for file in $files;
do
    link=~/$file;
    original=$PWD/$file;
    current="$(readlink $link)" 
    echo $current
    echo $original
    if [ -h $link ] && [ "$current" == "$original" ]
    then
        echo "$file is already installed";
        continue;
    fi;

    printf "Install ${file}? (y/n) ";
    if [ -f $link ];
    then
        printf "WARNING: will override $link ";
    fi;

    read input;
    if [ $input = "y" ];
    then 
        if [ -f $link ]; then rm $link; fi;
        if ln -s $original $link;
        then
            echo "Linked $original to $link";
        else
            echo "Linking Failed! :("
        fi;
    else
        echo "Skipping $file...";
    fi;
done;
