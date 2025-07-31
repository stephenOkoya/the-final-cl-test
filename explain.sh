#!/bin/bash

# This script assumes a certain file structure within the 'piscine-go repo'
# for demonstration purposes. In a real scenario, these data files would
# already exist in the repository.

echo "--- Setting up dummy data files for demonstration ---"

# Create a dummy witness_data.txt file
cat << EOF > witness_data.txt
Name: John Doe, Interview: 101, Role: Regular Witness
Name: Alice Smith, Interview: 205, Role: Key Witness
Name: Bob Johnson, Interview: 310, Role: Regular Witness
EOF

# Create a dummy suspect_data.txt file
cat << EOF > suspect_data.txt
Name: Jane Miller, Car: Red Sedan, Status: Main Suspect
Name: Chris Evans, Car: Blue SUV, Status: Not Arrested
Name: Emily White, Car: Green Hatchback, Status: Arrested
Name: David Brown, Car: Black Truck, Status: Not Arrested
Name: Sarah Davis, Car: Yellow Van, Status: Not Arrested
Name: Frank Green, Car: White Coupe, Status: Arrested
EOF

echo "--- Data setup complete. Outputting requested format ---"
echo ""

# 1. First and last name of the key witness
grep "Key Witness" witness_data.txt | \
awk -F', ' '{print $1}' | \
sed 's/Name: //'

# 2. Interview number of the key witness
grep "Key Witness" witness_data.txt | \
awk -F', ' '{print $2}' | \
sed 's/Interview: //'

# 3. Names of the 3 other main suspects not arrested, sorted by last name
grep "Not Arrested" suspect_data.txt | \
awk -F', ' '{print $1}' | \
sed 's/Name: //' | \
sort -k2 | \
head -n 3

echo ""
echo "--- Script finished ---"

# Clean up dummy data files
rm witness_data.txt suspect_data.txt
