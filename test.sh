chGo() {
    currentDir=$(pwd)
    cd $currentDir/$1
    echo -e "\033[32mprocessing path: \033[34;40m$currentDir/$1\033[0m"
    for i in ./*
    do
        if test -d $i
        then
            if [ -n $(echo $i | awk -F' ' '/go(lang)?([\w.]*)?/{print}') ]
            then
                newDir=$(echo $i | sed -e '1s/golang/Go/g' -e '1s/go/Go/g')
                if [ -d $newDir ]
                then
                    echo -e "\033[33mDirectory $newDir is already existed\033[0m"
                else
                    mkdir $newDir
                    if [ $? -eq 0 ]
                    then
                        echo -e "\033[32mcreate dir $newDir\033[0m"
                    fi
                fi
            fi
            chGo $i
        elif test -f $i
        then
            if [ -n $(echo $i | awk -F' ' '/go(lang)?([\w.]*)?\.md/{print}') ]
            then
                newName=$(echo $i | sed -e '1s/golang/Go/g' -e '1s/go/Go/g')
                mv $i $newName 
                if [ $? -eq 0 ]
                then
                    echo -e "\033[32mmv $i -> $newName\033[0m"
                fi
            else
                echo pass' '$i
            fi
        fi
    done
    cd $currentDir/
}

rootDir=$(pwd)
chGo $1 
cd $curentDir
