#!/bin/bash
# create_venv.sh - Create Python virtual environment for 
# better Package Management and Isolation

#check if venv directory exists
if [ ! -d ".venv" ]; then   
    echo "Creating virtual environment..."  
    python3 -m venv .venv
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment."
        exit 1
    fi
else
    echo "Virtual environment already exists."
fi

echo "Activating virtual environment..."
source .venv/bin/activate

#check if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "requirements.txt found."
else
    echo "requirements.txt not found. Please ensure it exists in the current directory."
    exit 1
fi

#check if dependencies are already installed
echo "Checking installed packages..."
echo "Missing packages will be installed."
pip install -r requirements.txt

echo "Virtual environment setup complete."
echo "To activate the virtual environment manually, run:"
echo "source .venv/bin/activate"
echo "To deactivate, simply run:"
echo "deactivate"