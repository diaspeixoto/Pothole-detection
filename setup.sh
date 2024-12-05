#!/bin/bash

# Function to print messages with colors
print_message() {
  echo -e "\033[1;32m$1\033[0m" # Green color for messages
}

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
  echo "Python3 is not installed. Please install Python3 and try again."
  exit 1
fi

# Update and install required packages
sudo apt update
sudo apt install python3-venv python3-pip unzip

# Display the detected Python version
print_message "Detected Python version: $(python3 --version)"

# Create a virtual environment
print_message "Creating virtual environment..."
python3 -m venv venv

ACTIVATE_PATH="./venv/bin/activate"

# Activate the virtual environment
print_message "Activating virtual environment..."
source "$ACTIVATE_PATH"

# Install Kaggle package within the virtual environment
print_message "Installing Kaggle **********"
pip install --upgrade pip  # Ensure pip is upgraded
pip install kaggle  # Use pip to install kaggle inside the virtual environment

print_message "Installing Dataset **********"
kaggle datasets download rajdalsaniya/pothole-detection-dataset

print_message "Unzipping Dataset **********"
# Check if the zip file exists
if [[ -f "pothole-detection-dataset.zip" ]]; then
  unzip -q pothole-detection-dataset.zip -d pothole-detection-dataset
  rm pothole-detection-dataset.zip
else
  echo "Error: Dataset zip file not found."
  deactivate
  exit 1
fi

# Install dependencies from requirements.txt (if it exists)
if [[ -f "requirements.txt" ]]; then
  print_message "Installing dependencies from requirements.txt..."
  pip install -r requirements.txt
else
  echo "requirements.txt not found. Please create the file and try again."
  deactivate
  exit 1
fi

print_message "Setup complete! To activate the virtual environment later, run:"
print_message "    source ./venv/bin/activate"
