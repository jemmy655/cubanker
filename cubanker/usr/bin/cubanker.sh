#!/bin/bash
clear
echo "************ Restoring default database *************"
echo "Please enter your MySQL root password"
echo " This script will create a database called CX "
read -p "Press CTRL-Z if you don't want to overwite your cx database"
mysql -u root -p cx < /src/cubanker/mysql/cx.sql"
echo "------------ Installation complete --------------"
read -p "Push Enter to close terminal"


