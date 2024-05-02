#!/bin/bash

# Prompt Mary to enter the IP address
read -p "Mary, please enter the IP address you want to connect to: " ip_address

# Define the URL for the POST request
post_url="http://${ip_address}:5000/add_message"
# Define the URL for the GET request to retrieve John's last message
get_url="http://${ip_address}:5000/get_last_message"

# Define the header indicating content type to be JSON
header="Content-type: application/json"

# Function to retrieve John's last message
function get_last_message {
    last_message=$(curl -s "$get_url")
    echo "$last_message"
}

# List of Mary's messages
mary_messages=(
    "Mary: Good, John. Yours?"
    "Mary: Ok, great!"
    "Mary: Can you share it asap?"
    "Mary: Thanks!"
    "Mary: Nope, all set. Thanks again."
    "Mary: Btw, got plans for lunch?"
    "Mary: Thinking of grabbing some sushi."
    "Mary: Of course not, the more the merrier!"
    "Mary: Perfect, see you then!"
    "Mary: You too, John. See you at lunch!"
)

# Iterate over each message in Mary's list
for message in "${mary_messages[@]}"; do
    # Extract sender and message
    sender="${message%%:*}"
    message="${message#*: }"

    # Prepare payload for the POST request
    payload="{\"user\": \"$sender\", \"message\": \"$message\"}"

    # Send the POST request
    response=$(curl -s -X POST -H "$header" -d "$payload" "$post_url")

    # Print response
    echo "Response for message: $message"
   
    # If it's not the last message, wait for John's response
    if [[ $message != "${mary_messages[-1]}" ]]; then
        echo "Waiting for John's response..."
        # Retrieve John's last message
        sleep 5
        last_message=$(get_last_message)
        echo "John's last message: $last_message"
        echo "----------------------------------------"
        read -p "Press Enter to send the next message..."
    fi
done
