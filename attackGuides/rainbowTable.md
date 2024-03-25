The passwords in a computer system are not stored directly as plain texts but are hashed using encryption. A hash function is a 1-way function, which means that it can’t be decrypted. Whenever a user enters a password, it is converted into a hash value and is compared with the already stored hash value. If the values match, the user is authenticated.

The raintable is a precomputed dictionary of plaintext passwords and their corresponding hash values that can be used to find out what plaintext password produces a particular hash. Doing an raintable attack is quicker than a simple bruteforce attack because the hash value was previously calculated.

https://security.stackexchange.com/questions/92903/rainbow-tables-hash-tables-versus-wpa-wpa2