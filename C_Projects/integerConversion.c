// Bawer Alissa
//G00974209
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>



const char *BinaryConvertion(int a);
const char *HexConvertion(int a);
const char *OctalConvertion(int a);
char *getDateAndTime();
int getInteger();
char saveFileToText(char bin, char hex, char oct,int f);


int main()
{
    //This will print out the time and date from the function getDateandTime()
    int a = 0;
    int b = 0;
    int c = 0;
    
    printf("\nThe time and date today is : %s\n", getDateAndTime());
    
    while(c != 1)
        
    {
        b = getInteger();
        if(b == -1)
        {
            break;
        }
        else
        {
            printf("\nDecimal: %d\n", b);
            char hexa = *HexConvertion(b);
            char octal = *OctalConvertion(b);
            char binary = *BinaryConvertion(b);
            saveFileToText(b, hexa, octal, binary);
        }
    }
}

//************************************************************************

int getInteger()
{  //This function is receiving the integer the user is inputting...Making sure it is in the correct parameters
    int num = 0;
    char exit = 0;
    
    
    printf("Enter an int that ranges between 1 - 1,000,000, otherwise type x to exit now: ");
    scanf("%s", &exit);
    if(exit == 'x')
    {
        return -1;
    }
    num = atoi(&exit); //Changes the char into an int
    if(num > 1000000 || num < 1)
    {
        printf("\nThe input was not in the required range. Please try again!\n");
        return 0;
    }
    else if(num <= 1000000 && num >= 1)
    {
        printf("The integer was in the range! Printing the outputs down below!\n");
    return num;
    }
    return 0;
}



char saveFileToText(char bin, char hex, char oct,int f)
{ //This will ask the user if they want to save the current output into a text file
    char file;
    printf("\nWould you like to save the current output into a file? [y/n]: ");
    scanf("\n%c", &file);
    char nameTextFile;
    
    if(file == 'y')
    {
        FILE *newTextFile;
        int x;
        char nameTextFile;
        printf("\nEnter file name:\n ");
        scanf("%s", &nameTextFile);
        newTextFile = fopen(&nameTextFile, "w"); //Open the text file
        fprintf(newTextFile, "Name: Bawer Alissa\n");
        fprintf(newTextFile, "Today's date and time is : %s\n", getDateAndTime());
        fprintf(newTextFile, "Decimal: %d\n", f);
        fprintf(newTextFile, "Hexidecimal: %d\n", *HexConvertion(f));
        fprintf(newTextFile, "Octal: %d\n", *OctalConvertion(f));
        fprintf(newTextFile, "Binary: %d\n", *BinaryConvertion(f));
        fclose(newTextFile); //Closes the text file
        printf("\nFile was succesfully saved! Have a nice day!.\n");
    }
    else
    return file;
    return 0;
}

const char *BinaryConvertion(int a)
{ //This will convert the decimal to Binary
    int remainder, quotient; 
    char binNumber[100]; 
    int decNumber = a; int i = 1; int j;
    char *cra = binNumber; quotient = decNumber;
    
    printf("Binary:");
    while(quotient != 0)
    {
        binNumber[i++] = quotient % 2;
        quotient = quotient/2;
    }
    for(j = i-1; j > 0; j--)
        printf("%d", binNumber[j]);
    return cra;
}

const char *OctalConvertion(int a)
{ //Function that will convert the decimal into Octal
    int remainder;
    int decNumber = a;
   long int quotient = decNumber;
    char hexNumber[100];
    char *bra = hexNumber;
    int i = 1; int j; int temp;
    
    printf("Octal: ");    
    while(quotient != 0)
    {
        temp = quotient % 8;
    if(temp < 10)
        temp = temp + 48;
    else
        temp = temp + 55;
        hexNumber[i++] = temp;
        quotient = quotient/8;
    }
    for(j = i-1; j > 0; j--)
    {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
    return bra; 
}


const char *HexConvertion(int a)
{ //Function that will convert the decimal into Hexidecimal
    int remainder;
    int decNumber = a;
   long int quotient = decNumber;
    char hexNumber[100];
    char *bra = hexNumber;
    int i = 1; int j; int temp;
    
    printf("Hexidecimal: ");    
    while(quotient != 0)
    {
        temp = quotient % 16;
    if(temp < 10)
        temp = temp + 48;
    else
        temp = temp + 55;
        hexNumber[i++] = temp;
        quotient = quotient/16;
    }
    for(j = i-1; j > 0; j--)
    {
        printf("%c", hexNumber[j]);
    }
    	printf("\n");
    return bra; 
}

char *getDateAndTime()
{ //The function to get the time and date
    time_t t;
    time(&t);
    return ctime(&t);
}




