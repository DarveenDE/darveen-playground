#!/bin/bash

# The public SSH key
SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCstszQFc0eYnpEH8PQM3Zsx8rySKouL0E5Bbdqss/VNoIaKubVtL+mJbP57ghHdTONQWYwngICw76EL1mk4+4s3bGLnvmYkND6KqH/4eo5/ko+ba3TfD3hoVhXowknuc3T68SANh2fDjJD+kFWTm92bNrSkRD+/fL/ilSrfEIEC5xkGtbBfMgvRpcHnca+4m/niAqiO5AAj1zP9rvt4Rhjg3mVywLosW/rVW2kf47Bs8yG5SqKsYx/a4+wBK4UhScKzL2gejPepx+HSnPPyGf9HWvS4caMkXKRLOgX4CDsDYiAvfFbafECk4I3hZ2LcC9wg3XwBriJJbS/ldzDlFWUng7r3F0XTm2Fjtbex37s+7lEKvx2sAEmueOTkhhjhmrWHn4W5rwvWjYLkYmN66hXh0MaIGDwuBOoIx4HChWn0QjYuO9yTUOiKxbESdYh946m2GD4eTSaWCBnMCS5+qgUUrSVLHW76Q91OsqnSrEZFbXaBHhNErhNJwYQnukPlos="

# Create the ansible user with /bin/bash as the default shell
useradd -m -s /bin/bash ansible

# Create the .ssh directory for the ansible user
mkdir -p /home/ansible/.ssh

# Add the SSH public key to authorized_keys
echo $SSH_KEY > /home/ansible/.ssh/authorized_keys

# Set proper permissions for the .ssh directory and authorized_keys file
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys

# Change the owner of the .ssh directory to the ansible user
chown -R ansible:ansible /home/ansible/.ssh

# Grant ansible user passwordless sudo privileges
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible

# Make sure the sudoers file is only writable by the root user
chmod 440 /etc/sudoers.d/ansible

echo "The User for Ansible has been created."
