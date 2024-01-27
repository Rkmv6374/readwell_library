echo "user can delete their booknumber from the library"





filename="/home/aman/task/readwell_library"



while true

do

	echo "enter the book id  which you want to delete"

	read id



	if grep -q "^$id" "$filename" 

	then

		awk -v num="$id" -F ":" 'num != $1 {print $0}' $filename  >> tempfile && mv tempfile $filename

		echo "successfully deleted the records of book $id"



	else

		echo "readwell library doest not contain any book of this $id"

		echo "do you want to continue? (y/n)"

		read tt

		if [[ "$tt" == "n" ]] 

		then

			exit

		else 

			continue

		fi



	fi

	echo "you have successfully deleted!"

	echo "Do you want to continue to delete the book id ? (y/n)"

	read choice



	if [[ "$choice" == "n" ]]

	then

		echo "you are redirecting to main.sh "

		break

	fi

done







