echo "user can read the book  from the library"





filename="/home/aman/task/readwell_library"



while true

do

        echo "enter the book name  which you want to read"

        read name



        if grep -q "^[0-9]*:$name" "$filename"

        then

		out=$(awk -v num="$name" -F ":" 'num == $2 {print $0}' $filename)	

                echo " The records of book $name"

		echo "$out"



        else

                echo "readwell library doest not contain any book of this $name"

                echo "do you want to continue? (y/n)"

                read tt

                if [[ "$tt" == "n" ]]

                then

                        exit

                else

                        continue

                fi



        fi

        echo "you have successfully read the $name"

        echo "Do you want to continue to read the book id ? (y/n)"

        read choice



        if [[ "$choice" == "n" ]]

        then

                echo "you are redirecting to main.sh "

                break

        fi

done

