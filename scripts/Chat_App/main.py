from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func
import os
import json
from sqlalchemy import desc

app = Flask(__name__)
# definfing URL or Path to save our DB
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///books.db"
# Creating DB instance to reference throughout the code
db = SQLAlchemy(app)

#The following code block is used to create a db instance from flask_sqlalchemy and use it to define our Book table.
# Define a model class
class Chat(db.Model):
   # Using ISBN as a primary key
   id = db.Column(db.Integer, primary_key=True)
   user = db.Column(db.String(150))
   message = db.Column(db.String(150))

   @property
   def as_json(self):
       """ Returns object data in a serializable format
       """
       return {
           'id': self.id,
           'user': self.user,
           'message': self.message
       }
   
# If the DB doesn't exit recreate it else don't overwrite it
if not os.path.exists('books.db'):
   with app.app_context():
       db.create_all()
       
@app.route('/add_message', methods=['GET', 'POST'])
def add_book():
   # GET request for getting all books from DB
   if request.method == "GET":
       # retreiving all the books from DB
       messages = Chat.query.all()
       # serializing objects so that we can send them in a JSON object
       serialized_messages = [message.as_json for message in messages]
       # sending all books back to the client in JSON object
       return jsonify(serialized_messages)

   # POST request for adding book to DB
   if request.method == "POST":
    # Getting user-passed data
    payload = request.get_json()

    # Query the last id from the database
    last_id = db.session.query(func.max(Chat.id)).scalar()

    # If there are no records in the database, set the id to 1, otherwise increment the last id
    new_id = last_id + 1 if last_id is not None else 1

    # Creating a message object with the new id
    newMessage = Chat(id=new_id,
                      user=payload['user'],
                      message=payload['message'])

    # add new message object to DB
    db.session.add(newMessage)

    # commit db to save changes
    db.session.commit()

    # return the same book to let the user know that it has been added to the DB
    return jsonify(json.dumps(payload))
   

@app.route('/get_last_message', methods=['GET','POST'])
def get_last_message():
   # GET request for getting the last massage from DB
   if request.method == "GET":
        # Querying for the message with the largest id
        last_message = Chat.query.order_by(desc(Chat.id)).first()
        
        # Check if there is a message
        if last_message:
            # Serialize the last message
            serialized_last_message = last_message.as_json
            return jsonify(serialized_last_message)
        else:
            # Return a message indicating that there are no messages
            return jsonify({"message": "No messages found"})



if __name__ == "__main__":
   app.run(host='0.0.0.0', port=5000, debug=True)