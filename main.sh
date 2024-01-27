echo "Welcome to the Readwell Library"





while true

do

	echo "Select the one of the operation which you want from Readwell Library"

	echo "1. Adding the Book to Readwell Library"

	echo "2. Deleting the Book from Readwell Library"

	echo "3. Modify the Book content of Readwell Library"

	echo "4. Read the Book of the Readwll Library"

	echo "5. exit from the Library"



	echo "Enter the selected option"

	read option 



	case $option in 



		1)

			echo "Welcome to the Adding features of Readwell Library"

			./addtion.sh

			;;



		2)

			echo "Welcome to the Deletion features of Readwell Library"



			/del.sh

			;;



		3)

			echo "Welcome to the modification feature of Readwell Library"

			./update.sh

			;;



		4)

			echo "Welcome to the reader section of Readwell Library"

			./read.sh

			;;

		5)

			echo "you are now exiting from the Readwell Library"

			exit

			;;

		*)

			echo "you have choosen none of the option. please choose it from the option"



	esac



done





