#! /usr/bin/bash

if [ -z $1 ]
then 
    echo "[!] No file selected"
else 
    file=$1
    if [ -e $file ]
    then    
        if [ -f $file ]
        then
            if ! [ -w $file ]
            then 
                read -p "Write permissions are not available. Do you want to change permissions ?" choice
                if ! [ -z choice ]
                then 
                    # Checking and modifying permissions
                    if [[ $choice == "y" || $choice == "Y" ]]
                    then                     
                        sudo chmod +w $file
                    else 
                        echo "[!] Read protected file"
                    fi
                fi
            fi

            echo "FILE: $file (Press ctrl + d to save)"

            # read file and print
            while IFS=' ' read line
            do
                echo $line
            done < $file

            # provide cursor to the user for writing
            if [ -w $file ]
            then
                cat >> $file
                echo "[*] File saved with changes"
            fi
            
        else echo "[!] Can ony read a file"
        fi
    else 
        echo "[!] No such file exits"
    fi
fi