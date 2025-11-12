#!/bin/zsh

echo "Installing curl..."
brew install --formula --display-times --require-sha --verbose curl

echo "Installing wget..."
brew install --formula --display-times --require-sha --verbose wget

echo "Installing GNU awk..."
brew install --formula --display-times --require-sha --verbose gawk

echo "Installing GNU sed..."
brew install --formula --display-times --require-sha --verbose gnu-sed

echo "Installing GNU tar..."
brew install --formula --display-times --require-sha --verbose gnu-tar

echo "Installing unzip..."
brew install --formula --display-times --require-sha --verbose unzip

echo "Installing GPG..."
brew install --formula --display-times --require-sha --verbose gnupg

echo "Installing git..."
brew install --formula --display-times --require-sha --verbose git

echo "Installing ADB..."
brew install --cask --display-times --require-sha --verbose android-platform-tools

echo "Installing Java..."
brew install --cask --display-times --require-sha --verbose temurin@17
brew install --formula --display-times --require-sha --verbose openjdk
brew install --formula --display-times --require-sha --verbose openjdk@21

echo "Installing Eclipse IDE..."
brew install --cask --display-times --require-sha --verbose eclipse-java

echo "Installing proguard..."
brew install --formula --display-times --require-sha --verbose proguard

echo "Installing Python..."
brew install --formula --display-times --require-sha --verbose python
brew install --formula --display-times --require-sha --verbose python@3.9
