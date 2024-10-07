#!/bin/bash
PROJECT_DIR=~/code/benkant/clubspark-lta-tennis-court-booking-automation-finsbury

# Navigate to the project directory
cd "$PROJECT_DIR" || exit

# Install dependencies
npm install

# Run the tests
npx jest

