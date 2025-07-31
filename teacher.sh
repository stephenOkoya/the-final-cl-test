#!/bin/bash

# This script is designed to be placed inside the 'mystery' folder
# within the 'piscine-go repo'.

echo "--- Setting up dummy data for teacher.sh demonstration ---"

# Create dummy files within the current directory (which is assumed to be 'mystery')
# for demonstration purposes. In a real scenario, these files would already exist.

# Create a dummy key_info.txt file that contains the key interview number.
# This file's content and location (within 'mystery') are assumed to be consistent.
cat << EOF > key_info.txt
Important Clue: The key to solving this case is Interview Number: 42.
Other miscellaneous information: This line is not relevant.
EOF

# Create a dummy interview file corresponding to the key interview number (e.g., 42_interview.txt).
cat << EOF > 42_interview.txt
Interview 42 Transcript:
Subject: Alex Johnson
Date: 2025-07-30
Details: Alex provided crucial information about the whereabouts of the stolen artifact.
They mentioned seeing a red van near the old warehouse. This was the breakthrough!
EOF

echo "--- Data setup complete. Running teacher.sh ---"
echo ""

# Step 1: Isolate the number (and only the number) of the key interview
# into an environment variable.
# We use 'grep' to find the line containing "Interview Number:", then 'awk'
# to print the last field (which is the number), and 'sed' to remove any trailing period.
export KEY_INTERVIEW_NUMBER=$(grep "Interview Number:" key_info.txt | awk '{print $NF}' | sed 's/\.$//')

# Step 2: Print the newly created environment variable.
echo "Key Interview Number (Environment Variable):"
echo "$KEY_INTERVIEW_NUMBER"
echo ""

# Step 3: Print what the interview contains.
echo "Content of the Key Interview (${KEY_INTERVIEW_NUMBER}_interview.txt):"
# Check if the interview file exists before attempting to print its content.
if [ -f "${KEY_INTERVIEW_NUMBER}_interview.txt" ]; then
    cat "${KEY_INTERVIEW_NUMBER}_interview.txt"
else
    echo "Error: Interview file '${KEY_INTERVIEW_NUMBER}_interview.txt' not found."
fi
echo ""

# Step 4: Print the content of the environment variable MAIN_SUSPECT.
echo "Content of MAIN_SUSPECT Environment Variable:"
# Check if the MAIN_SUSPECT environment variable is set.
if [ -z "$MAIN_SUSPECT" ]; then
    echo "MAIN_SUSPECT environment variable is not set."
    echo "(To test this, set it before running the script, e.g.: export MAIN_SUSPECT='Jane Miller')"
else
    echo "$MAIN_SUSPECT"
fi
echo ""

echo "--- Script finished ---"

# Clean up dummy data files created for this demonstration.
rm key_info.txt "${KEY_INTERVIEW_NUMBER}_interview.txt"



#not part of the code just tells execute name from mystery folder b4 running teacher.sh
#---------------------------------------------------------------
#You're seeing that message because, as the script explains, the MAIN_SUSPECT environment variable hasn't been set in your current shell session before running teacher.sh.

#The line in the script:

#Bash

#if [ -z "$MAIN_SUSPECT" ]; then
 #   echo "MAIN_SUSPECT environment variable is not set."
  #  echo "(To test this, set it before running the script, e.g.: export MAIN_SUSPECT='Jane Miller')"
#else
 #   echo "$MAIN_SUSPECT"
#fi
#This code block checks if the MAIN_SUSPECT variable is empty (-z "$MAIN_SUSPECT"). If it is, it prints the "not set" message and the helpful suggestion on how to set it. If it were set, it would print its value.

#To see a different output for that section, you would need to run a command like export MAIN_SUSPECT="Jane Miller" in your terminal before executing ./teacher.sh.
