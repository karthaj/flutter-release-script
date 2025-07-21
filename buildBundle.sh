#!/bin/bash

VERSION_FILE=".buildVersion"

echo ""
echo "!!! Building Bundle !!!"

# Confirm build
read -p "Are you sure you want to build ? [Y/N] " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting build..."
    exit 1
fi

# Check if version file exists, if not create with 0 and timestamp
if [ ! -f "$VERSION_FILE" ]; then
    echo "0" > "$VERSION_FILE"
    echo "$(date +"%Y-%m-%d %H:%M:%S")" >> "$VERSION_FILE"
fi

# Read current version (only first line)
CURRENT_VERSION=$(head -n 1 "$VERSION_FILE")

# Validate current version number
if ! [[ "$CURRENT_VERSION" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid version number in $VERSION_FILE"
    exit 1
fi

# Ask user whether to replace or make new version
read -p "Replace current version (R) OR make new version (N)? [R/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Rr]$ ]]; then
    NEW_VERSION=$CURRENT_VERSION
    echo "Keeping current version: $NEW_VERSION"
elif [[ $REPLY =~ ^[Nn]$ ]]; then
    NEW_VERSION=$((CURRENT_VERSION + 1))
    echo "Incrementing version to: $NEW_VERSION"
else
    echo "Invalid choice. Aborting..."
    exit 1
fi

# Write the version and timestamp to the file
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "$NEW_VERSION" > "$VERSION_FILE"
echo "$TIMESTAMP" >> "$VERSION_FILE"

echo "Starting build..."

rm -R build/app/outputs/bundle/release/*

flutter build appbundle --build-number "$NEW_VERSION" --release

open  build/app/outputs/bundle/release

echo "Build completed."
