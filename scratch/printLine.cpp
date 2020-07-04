/*

	File:    printLine.cpp

	Author:  Noah Castetter
	Version: 0
	Created: 5-25-2020
	Updated: 5-25-2020

	Description: A simple cpp program which prints a line into the 
	file specified by the file path passed in argument one of main.
	
	LACKS ELEGANCE, CONSIDER OMNIBUSING INTO A PACKAGE

	WARNING: WILL MOST LIKELY BE SHOVED INTO ANOTHER PACKAGE

	USAGE: 

*/
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argv, char** argc){

	ofstream printLineDest;
	string filePath = argc[1];
	printLineDest.open(filePath);
	printLineDest << endl;
	printLineDest.close();
	return 0;
}
