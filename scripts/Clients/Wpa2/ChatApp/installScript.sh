#!/bin/bash

# Clone the repository from GitHub
git clone https://github.com/l4ti/TSP-NET4104-HackTheFlag.git

# Navigate into the cloned directory
cd TSP-NET4104-HackTheFlag

# Update package index
sudo apt update

# Install Python 3 and pip3
sudo apt install -y python3 python3-pip

# Install Flask and SQLAlchemy using pip3
pip3 install flask flask_sqlalchemy

# Run the Python main code
python3 main.py

# Run the Python post command 10 times
./John.sh #when asked, write the IP address on with your main application is running
./Mary.sh #when asked, write the IP address on with your main application is running
 


