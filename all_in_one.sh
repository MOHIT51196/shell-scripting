#! /usr/bin/bash

# ========== VARIABLES ============
# the pre defined variables
echo $BASH
echo $BASH_VERSION
echo $HOME

# variables cannot start with number
name1="Mohit Malhotra"

# custom variable
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

file1='dummy.dart'

if [ -e $file1 -a -f $file1 ]
then
    while IFS=' ' read -r line
    do 
    echo $line
    done < $file1
fi

# ========== ARRAYS ============
# arrays in shell can be hetrogenous 
# Can add element at any index , there is no out of bound excepts
# Gaps in array are allowed

arr=(12 'mohit' 'vaibhav')
# Show indices : ${!arr[@]}
# Show elements : ${arr[index]}
# Show all elements : ${arr[@]}
# Show size of array : ${#arr[@]}

echo "ARRAY : " ${arr[@]}
echo "ELEMENT[2] : " ${arr[1]}
echo "ARRAY SIZE : " ${#arr[@]}
echo "ARRAY INDICES : " ${!arr[@]}

# Creation 
arr[6]='malhotra'
echo ${arr[@]}      # data will print in sequence only
echo ${!arr[@]}

# modification
arr[2]='ayushi'
echo "After modification : " ${arr[@]}

# Deleting the value
unset arr[1]
echo "After deletion : " ${arr[@]}


# ========== LOOPS ============
# WHILE
count=3
while (($count > 0)) 
do
    echo "Calling this $count time(s)...."
    (( count-- ))
    sleep 0.3  # sleeping for 0.3 sec
done

# UNTIL

until (($count > 2))
do 
echo "Recalling back this $count times...."
((count++))
sleep 0.4
done


# FOR IN
# 1. For collection
# for i in A B C
# do 
#     ...
# done


for i in "Mr." "Mohit" "Malhotra"
do 
    echo -e "$i \c"
done
echo 

# 2. For Range
# for i in {start..end..step}
# do 
# ...
# done

# NOTE : Ranges work with Bash version 3.+
for val in {0..10..3}
do
    echo -e "VAL = $val"
done

# FOR
# for (( i=0; i<10; i++ ))
# do 
# ...
# done


for (( v=4; v>1; v-- ))
do
    echo -e "Counter = $v"
done


# Example
for cmd in date pwd ls "ls -lah"
do
echo -e "\n---------- $cmd -----------\n"
$cmd
done


# SELECT
# This loop is use to provide menus
# By nature select loop goes on with selection repeatedly

select nav in "Home" "Profile" "Settings" "About us"
do
    # echo "Selected $nav"
    case $nav in
    "Home")
        echo Welcome to Home
        ;;
    "About us")
        echo Nothing interesting about us
        ;;
    *)
        echo "Invalid entry"
    esac
done