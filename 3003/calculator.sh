#!/bin/bash

clear

echo "Enter first number: "
read a

echo "Enter second number :"
read b

echo ""
echo "## MENU ##"
echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Division"
echo "5.Modulus"
echo ""

echo "Enter a choice : "
read ch

echo "Result ::"

if [[ $ch -eq	 1 ]]
then
	echo "$((a + b))"
elif [[ $ch -eq 2 ]]
then
	echo "$((a - b))"
elif [[ $ch -eq 3 ]]
then
	echo "$((a * b))"
elif [[ $ch -eq 4 ]]
then
	echo "$((a / b))"
elif [[ $ch -eq 5 ]]
then
	echo "$((a % b))"
else
	echo "WRONG CHOICE"
fi
