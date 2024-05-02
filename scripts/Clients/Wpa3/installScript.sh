#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" && $(command -v dpkg &>/dev/null) ]]; then 
    echo "You are running Linux (Debian-based)."

    if [ "$EUID" -ne 0 ]
        then 
            echo "Please run as root. Exiting..."
            exit
    fi

    mkdir install.log
    echo "Updating system"
    {
        apt update
        apt upgrade -y
    } > install.log
    echo "Installing OpenSSH and Nginx"
    {
        apt install openssh nginx -y
    } > install.log
    cat /etc/passwd | grep "pi:" >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "Pi User Exists"
    else
        echo "User Not Found. Creating user..."
        useradd -m pi
    fi
    echo "pi:raspberry" | chpasswd
    echo "NEW PI USER PASSWORD: raspberry"

    echo "Populating Home Directory"
    dd if=/dev/urandom of=/home/pi/img01.jpg bs=1M count=10
    dd if=/dev/urandom of=/home/pi/img02.jpg bs=1M count=8
    dd if=/dev/urandom of=/home/pi/img03.jpg bs=1M count=11
    dd if=/dev/urandom of=/home/pi/school.docx bs=132K count=1
    dd if=/dev/urandom of=/home/pi/passport.pdf bs=512K count=5
    dd if=/dev/urandom of=/home/pi/data.txt bs=256K count=3
    dd if=/dev/urandom of=/home/pi/dog.png bs=1M count=7
    dd if=/dev/urandom of=/home/pi/confidential.zip bs=2M count=4
    dd if=/dev/urandom of=/home/pi/amelia.txt bs=128K count=2
    dd if=/dev/urandom of=/home/pi/document09.doc bs=256K count=6
    dd if=/dev/urandom of=/home/pi/employee42.jpg bs=1M count=9
    dd if=/dev/urandom of=/home/pi/quotation.txt bs=64K count=8
    dd if=/dev/urandom of=/home/pi/newdocument-2.xlsx bs=512K count=3
    dd if=/dev/urandom of=/home/pi/shareholders.pptx bs=1M count=7
    dd if=/dev/urandom of=/home/pi/employee_list.csv bs=256K count=4
    dd if=/dev/urandom of=/home/pi/autoAuthDB.sh bs=64K count=2
    dd if=/dev/urandom of=/home/pi/document.pdf bs=768K count=5
    dd if=/dev/urandom of=/home/pi/contacts.tar.gz bs=2M count=6
    dd if=/dev/urandom of=/home/pi/graph.jpg bs=1M count=8

    echo "Creating the Flag"
    touch /home/pi/cat.svg
    echo "Congratulations! You found the flag." | base64 > home/pi/cat.svg

    echo "Changing ownership of files"
    sudo chown -R pi:pi /home/pi

    echo "FINISHED CONFIGURATION"
    echo "Remember to remove this script and clear the history of commands from the machine."

else
    echo "This script requires Linux (Debian-based) with dpkg installed."
    exit 1
fi