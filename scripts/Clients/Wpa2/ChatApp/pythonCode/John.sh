#!/bin/bash

# Prompt John to enter the IP address
read -p "John, please enter the IP address you want to connect to: " ip_address

# Prompt John whether to reveal his password
read -p "Do you want to reveal your password? (yes/no): " reveal_password

# Initialize variable to hold password
password=""

# If John chooses to reveal his password
if [[ "$reveal_password" == "yes" ]]; then
    # Prompt John to enter his password
    read -p "Please enter your password: " password
fi

# Define the URL for the POST request
post_url="http://${ip_address}:5000/add_message"
# Define the URL for the GET request to retrieve Mary's last message
get_url="http://${ip_address}:5000/get_last_message?user=Mary"

# Define the header indicating content type to be JSON
header="Content-type: application/json"

# Function to retrieve Mary's last message
function get_last_message {
    last_message=$(curl -s "$get_url")
    echo "$last_message"
}

# List of John's messages
john_messages=(
    "John: Morning, Mary. How's your day?"
    "John: Pretty busy. Did you hear from Paul?"
    "John: Almost done."
)

# If John chooses to reveal his password, include it in the message
if [[ "$reveal_password" == "yes" ]]; then
    john_messages+=("John: Sure, \"$password\".")
else
    john_messages+=("John: Sure, but I prefer not to reveal my password.")
fi

john_messages+=(
    "John: No problem. Need help with anything else?"
    "John: Not yet. You?"
    "John: Sounds good. Mind if I join?"
    "John: Great, let's meet at noon?"
    "John: Looking forward to it. Take care till then."
)

# Iterate over each message in John's list
for message in "${john_messages[@]}"; do
    # Extract sender and message
    sender="${message%%:*}"
    message="${message#*: }"

    # Prepare payload for the POST request
    payload="{\"user\": \"$sender\", \"message\": \"$message\"}"

    # Send the POST request
    response=$(curl -s -X POST -H "$header" -d "$payload" "$post_url")

    # Print response
    echo "Response for message: $message"

    # If it's not the last message, wait for Mary's response
    if [[ $message != "${john_messages[-1]}" ]]; then
        echo "Waiting for Mary's response..."
        # Retrieve Mary's last message
        sleep 5
        last_message=$(get_last_message)
        echo "Mary's last message: $last_message"
        echo "----------------------------------------"
        read -p "Press Enter to send the next message..."
    fi
done
