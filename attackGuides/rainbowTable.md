# Rainbow Table Attack

The passwords in a computer system are not stored directly as plain texts but are hashed using encryption. A hash function is a 1-way function, which means that it can’t be decrypted. Whenever a user enters a password, it is converted into a hash value and is compared with the already stored hash value. If the values match, the user is authenticated.

The rainbowtable is a precomputed dictionary of plaintext passwords and their corresponding hash values that can be used to find out what plaintext password produces a particular hash. Doing an rainbowntable attack is quicker than a simple bruteforce attack because the hash value was previously calculated.

https://security.stackexchange.com/questions/92903/rainbow-tables-hash-tables-versus-wpa-wpa2

## Prerequisites : 
Before performing a rainbowTable attack, you need to :
- find the hash of the password  you want to decrypt. 
- find information about the form of the plaintext password (minimum and maximum length, format: numbers, alphabet, special characters..) by looking at the format of allowed passwords of the target application/system.



## Step1: Install rainbowcrack package

Open a terminal in kali and install the rainbowcrack package:
```
sudo apt install rainbowcrack
```


## Step2: Generate a rainbow table

Open the help menu of rtgen to display the options:
```
rtgen -h
```


Choose an option that corresponds to the form of the password and modify the following according to your case. 
```
rtgen <hash_algorithm> <charset> <length_min> <length_max> <table_index> <chain_min> <chain_num> <part_index>
```

Example: for a password "12345678", the following options can be used:    
```
sudo rtgen md5 numeric 1 8 0 100000 100000 0
```

We chose the values of 100000 and 100000 for the chain_length and chain_num to be able to have a larger rainbowTable (so it will include our password).

The creation of the rainbow table takes much time and storage space on system, but after creating it, we will be able to use it to crack passwords faster than with brute force.

The rainbow table will be stored in /usr/share/rainbowcrack directory.

## Step3: sort the rainbowTable
Go to the directory where the table file .rt is stored and sort the rainbowTable.
```
cd /usr/share/rainbowcrack
sudo rtsort .
```

## Step4: find the password
Use RainbowCrack tool to crack the password hash.
```
rcrack . -h <hash_of_password>
```

In our example, the md5 hash of the password "12345678" is "25d55ad283aa400af464c76d713c07ad".
```
rcrack . -h 25d55ad283aa400af464c76d713c07ad
```

The password will be displayed on the terminal. 