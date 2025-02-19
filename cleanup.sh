#!/bin/bash

# Remove duplicate directories
rm -rf ~/Documents/JosesTimer

# Ensure correct project structure
mkdir -p Sources/JosesTimer/Views
mkdir -p Sources/JosesTimer/ViewModels
mkdir -p Sources/JosesTimer/Models
mkdir -p Resources

# Remove any lingering duplicate files
find . -name "duplicate_*" -delete 