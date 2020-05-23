#include <iostream>
#include <fstream>
#include <string>

/* =========================================================================

 File: ReadFIleLiens.cpp

 Author: Noah Castetter
 Version: 0
 Created: 5-22-2020
 Updated: 5-22-2020#

 Description: A simple .cpp which takes a file name and path of a file
 and then prints every line of the file's contents into standard out.
 The original intent of this program is to be used to copy all files of
 with a certain extension into another directory, this script being 
 RMHPD.sh

 ========================================================================= */
using namespace std;

int main(int argc, char **argv){

// Input Validation
	if(argc != 1){
		cout << "READFILELINES.CPP_ERROR: EXPECTED 1 ARG" << endl;
	}else{
		
		// Printing every line from the file line by line
		// SPACE SEPERATED
		// TODO: Make sure you don't have to remove the newline
		//       character from the file path.
		ifstream file(argv[0]);

		string line;

		while(getline(file, line))
			cout << line << " ";
	}

return 0;
}
