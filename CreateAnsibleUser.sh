#!/bin/bash

SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBWeLCrqkbeWzEndt4ts2QvKZ2rVgScFG3LBYEdMaLjOcyxVGIh0iKHA2BxhcjjRKhjmyrkw6XqGNGdn4t7gAYqBOWwdm4Zj+rTms6+zEg09xWOU3Ou+cK09iTmkRSIHrBSBG7H9ARljXw7fpE76JXNGM6GBJgaf+IaM9gK5Fpb6fxy/2dpnOnsO+zzzfuMJmgd23hC1IG2HMZ1p82xlrqHbai4Zt3LKvueT0WAa7DmBBjSQEYN3gdvYu1ELU5ZN5039L2hLzBzBJNYX0ZdvKw21QQjYmxI81mp23mXORxz4bnVQH58Gle8xfKHuwvr9xRJfIKLeoW5RKTBPq7QOE2CtIAtZd+t9pj7WNUdeoJ/YaW2/w7VRyqQBqSTBNrQUNVuwWOwKLq+giZoXxxoGJxEY1Llgu5RQUF8++w7N14txgxXBaTd1s14UJjQjsl3MseGqiKu4j6bwIj4w1F0fRdmXJ0nVw6UqTwjxyrbHJyIInB8+XSHJMYOfyahFDntgU="

useradd -m -s /bin/bash ansible
mkdir -p /home/ansible/.ssh
echo $SSH_KEY > /home/ansible/.ssh/authorized_keys
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/.ssh
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
chmod 440 /etc/sudoers.d/ansible

echo "The User for Ansible has been created."
