#! /usr/bin/bash

# ========== VARIABLES ============
# the pre defined variables
echo $BASH
echo $BASH_VERSION
echo $HOME

# variables cannot start with number
name1="Mohit Malhotra"

# custom veriable
echo Developed by $name1
echo



# ========== USER INPUT ============

# input value  from user
# echo "Enter your nickname : "

# -e will interpret \
echo -e "Enter your nickname : \c"
read nick
echo $name1 is called $nick
echo



# input on same line
read -p "Tell me your age : " age
echo $name1 with age of $age says $msg
echo

# silent input for something like password
read -sp "Enter your password : " password
# concat your variable like this
echo "I see! you are thinking $password"
echo


# input an array of args
echo "Enter your atleast 2 hobbies :  " 
read -a hobs
# It will not print array variables like this but need {} around
echo $name1 likes $hobs[0]
echo "And also loves ${hobs[1]}"
echo 

# if your dont use any varibale in read
# default variable for cin is REPLY
echo "Enter your DOB"
read
echo "$nick is born on $REPLY"
echo 

# System set args
# $0 -> file name and $1,$2...so on is your commandline args
# echo File $0 is designed with arguments : $1, $2, $3
# echo
# echo ARGUMENTS AS ARRAY : $@
# echo

# ========== RELATIONAL OPERATORS ============
# Integer comparison
# WITH [<space> condition <space>]
# -eq, -ne
# -gt, -lt
# -ge, -le


# WITH ((condition))
# ==, !=, <, >, <=, >=

# String comparison
# = or == : if [ $a = $b ] 
# != : if [ $a != $b ]
# -z (Not null or empty) : if [ -z $a ]
# >, < (ASCII compare) : if [[ $a < $b ]]


# ========== CONDITIONAL ============

# IF-ELSE STATEMENTS
# every keyword should be in new line

# if [ $age -gt 28 ]
if (($age >= 28)) 
then echo Yes! You can drink alcohol 
fi

if [ $nick == "Emm" ]
then echo Hi Emm ! I know you
elif [ -z "$nick" ]
then echo Atleast Let me know your name
else echo Hi $nick
fi


# SWITCH CASE
# case variable in
# case1 )
#     ... ;;
# case2 ) 
#     ... ;;
# esac

echo -e "Enter any vehicle name : \c"
read vehicle

case $vehicle in
"car" )
    echo This is expensive;;
"bike" )
    echo This cheaper;;
esac


# ========== FILE OPERATIONS ============
# flag for OPERATIONS
#  -e : exists or not
#  -f : is file or not
#  -d : is directory or not
#  -c : is character special file
#  -b : is block special file 
#  -s : is file empty or not

# CHECKING PERMISSIONS
# -r : check read permissions
# -w : check write permissions
# -x : check execute permissions

cd Desktop/
echo -e "\nEnter the file name : \c"
read fname

if [ -e $fname ]
then
    echo file exist
    if [ -f $fname ]
    then
        if [ -s $fname ] 
        then echo file is having content
        else echo But file is empty
        fi
    fi
else 
    echo file not found
fi


# Writing in a file
if [ -e "$fname" ]
then 
    if [ -f $fname ]
    then
        # writing in the file
        # >> shows appending, > shows overiding
        if [ -w $fname ]
        then
            echo "Please write something on file (Press ctrl + d to save)"
            cat >> $fname
            echo File written successfully
        else echo File doesnt have permissions
        fi
    fi
fi



# ========== LOGICAL OPERATORS ============
# AND , OR, NOT
# incase of two conditions
# WAY 1
# if [ condition 1 ] && [ consition 2 ]

# WAY 2
# if [ condition1 -a condition2 ]

# WAY 3
# if [[ condition1 && condition2 ]]

echo "New way for checking age"
# if [[ $age -gt 21 &&  $age -le 50  ]]
if [ $age -gt 21 -a  $age -le 50  ]
then echo "You are fit for the football team"
else "Your age is not suitable for football"
fi

# ========== ARITHMETIC OPERATORS ============
# operators *, /, %, -, +
# WAY 1
# with echo use $(( expression ))  : this will take variables with or without $
# WAY 2
# with $(expr expression)  : this will take variables with $
# WAY 3
# with bc 
# syntax : "expression" | bc
num1=20
num2=10
echo $(expr $num2 + $num1)
echo $(( num1 / num2 ))

# With bc command expression on left is treated as input for right hand side
echo "$num1*$num2" | bc
echo "24.5-19.3" | bc


# use functions from math library
num4=24
echo "scale=8;sqrt(24)" | bc -l 


# ========== LOOPS ============

while [ $age -gt 20 ]
do 
    echo "You are big now !! Enjoy with a beer"
    (( age-- ))
     # Delay : sleep <seconds>
    sleep 1 
done


# ========== FILE HANDLING ============
# WAY 1
echo -e "\n===== WAY 1 =====\n"

while read line
do 
echo $line
done < dummy.dart


# WAY 2 (Piping)
echo -e "\n===== WAY 2 =====\n"

cat dummy.dart | while read line
do 
echo $line
done

# WAY 3 (Most effective as interpret escape characters)
# IFS : Internal Field Seperator
echo -e "\n===== WAY 3 =====\n"

while IFS=' ' read -r line
do 
echo $line
done < dummy.dart

