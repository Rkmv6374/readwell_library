#!/bin/bash



# Define the path to the Readwell Library file

readwell_library="/home/aman/task/readwell_library"



while true; do

    echo "Adding the book to the Readwell Library"

    echo ""



    echo "Enter the ID number of the book"

    read id



    # Validation of the book number

    if [[ ! "$id" =~ ^[0-9]+$ ]] || grep -q "^$id:" "$readwell_library"; then

        echo "Error: This book number already exists or is not a valid positive integer. Choose something unique."

        continue

    fi



    echo "Enter the name of the Book"

    read name

    echo "Enter the Author of the Book"

    read author

    echo "Enter the publisher Name of the Book"

    read publisher



    # Check the validation of the name, author, and publisher

    if [[ "$name" == "" || "$author" == "" || "$publisher" == "" ]]; then

        echo "Error: Please fill in all the credentials."

        continue

    fi



    echo "Enter Price of the Book"

    read price



    # Price validation

    if ! [[ "$price" =~ ^[0-9]+$ ]] || [[ "$price" -lt 0 ]]; then

        echo "Error: Price must be a non-negative integer."

        continue

    fi



    echo "Enter the year of release of the Book"

    read release



    echo "Enter the subject code of the Book"

    read subject_code



    # Validation for release year and subject code

    if [[ "$release" -lt 1996 || ( "$subject_code" != "UNIX" && "$subject_code" != "C" ) ]]; then

        echo "Error: The published year must be greater than 1995. Subject code must be C or UNIX."

        continue

    fi



    # Append the book information to the Readwell Library file

    echo "$id:$name:$author:$publisher:$price:$release:$subject_code" >> "$readwell_library"



    echo "The record for $name has been successfully added to Readwell Library."

    echo "Do you want to enter another book entry? (y/n)"

    

    read option



    if [ "$option" != "y" ]; then

        echo "You are redirecting to the main file."

        break

    fi

done

