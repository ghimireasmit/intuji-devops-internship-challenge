#!/bin/bash

# Update the package database
sudo apt-get update

# Install Java (Jenkins requires Java to run)
sudo apt-get install openjdk-11-jdk -y

# Add the Jenkins repository to the system
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package database again
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y

# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins to start at boot
sudo systemctl enable jenkins

# Print the initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
