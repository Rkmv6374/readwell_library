#!/bin/bash



echo "User can modify their book number from the library"



filename="/home/aman/task/readwell_library"



while true

do

    echo "Enter the book ID you want to modify"

    read id



    if grep -q "^$id:" "$filename"; then

        record=$(awk -v num="$id" -F ":" '$1 == num {print $0; exit}' "$filename")

        while true

        do

            echo "1. Book_Name"

            echo "2. Author"

            echo "3. Publisher"

            echo "4. Price"

            echo "5. Year of Release"

            echo "6. Subject Code"

            echo "7. Quit option"



            echo "Select any one option which you want to modify"

            read ch



            case $ch in

                1)

                    echo "Enter the name of the book"

                    read bname

                    awk -v num="$id" -v arg="$bname" -F ":" 'BEGIN{OFS=":"} {if (num == $1) {$2=arg;} print $0}' "$filename" > tempfile && mv tempfile "$filename"

                    echo "Successfully modified the name of the book"

                    ;;

                2)

                    echo "Enter the author name of the book"

                    read bauthor

                    awk -v num="$id" -v arg="$bauthor" -F ":" 'BEGIN{OFS=":"} {if (num == $1) {$3=arg;} print $0}' "$filename" > tempfile && mv tempfile "$filename"

                    echo "Successfully modified the author name of the book"

                    ;;

                3)

                    echo "Enter the publisher name of the book"

                    read bpublisher

                    awk -v num="$id" -v arg="$bpublisher" -F ":" 'BEGIN{OFS=":"} {if (num == $1) {$4=arg} print $0}' "$filename" > tempfile && mv tempfile "$filename"

                    echo "Successfully modified the publisher name of the book"

                    ;;

                4)

                    echo "Enter the price of the book"

                    read bprice

                    awk -v num="$id" -v arg="$bprice" -F ":" 'BEGIN{OFS=":"} {if (num == $1) {$5=arg;} print $0}' "$filename" > tempfile && mv tempfile "$filename"

                    echo "Successfully modified the price of the book"

                    ;;

                5)

                    echo "Enter the year of release of the book"

                    read brelease

                    awk -v num="$id" -v arg="$brelease" -F ":" 'BEGIN{OFS=":"} {if (num == $1) {$6=arg}; print $0}' "$filename" > tempfile && mv tempfile "$filename"

                    echo "Successfully modified the year of release of the book"

                    ;;

                6)

                    echo "Enter the subject code of the book"

                    read bsub

                    awk -v num="$id" -v arg="$bsub" -F ":" 'BEGIN{OFS=":"} {if (num == $1) {$7=arg} print $0}' "$filename" > tempfile && mv tempfile "$filename"

                    echo "Successfully modified the subject code of the book"

                    ;;

                7)

                    echo "Do you want to quit? (y/n)"

                    read opt



                    if [[ "$opt" == "y" ]]; then

                        break 

                    fi

                    ;;

                *)

                    echo "Choose a valid option"

                    ;;

            esac

        done

        echo "Successfully modified the records of book $id"

    else

        echo "Readwell library does not contain any book with ID $id"

        echo "Do you want to continue? (y/n)"

        read tt

        if [[ "$tt" == "n" ]]; then

            exit

        else

            continue

        fi

    fi

    echo "You have successfully modified!"

    echo "Do you want to continue to modify another book? (y/n)"

    read choice



    if [[ "$choice" == "n" ]]; then

        echo "You are redirecting to main.sh"

        break

    fi

done

