#!/bin/bash

# Clone the repository from GitHub
git clone https://github.com/l4ti/TSP-NET4104-HackTheFlag.git

# Navigate into the cloned directory
cd TSP-NET4104-HackTheFlag

# Install required Python packages using pip
pip install flask flask_sqlalchemy requests

# Run the Python main code
python3 main.py

# Run the Python post command 10 times
for i in {1..10}
do 
    python3 client_post.py 
    python3 client_get.py
done 




