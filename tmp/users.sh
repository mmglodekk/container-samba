#!/bin/bash

while IFS=" " read -r user pass
do
  useradd $user
  printf "$pass\n$pass\n" | smbpasswd -a $user
done < "users.tmp"
