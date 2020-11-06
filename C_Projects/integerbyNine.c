

//  Created by Bawer Alissa on 6/29/18.
//  Copyright © 2018 Bawer Alissa. All rights reserved.


#include <stdio.h>
#include <stdlib.h>

int get_input();
void display(int y);

int main()
{
    int y;
    y = get_input(y);
    display(y);
    return 0;
}

int get_input()   //This will help us find the value and make sure the user of the program doesn't enter an invalid code
{
    int a;
    int n;
    n = 0;
    

    printf("Please enter an integer between 1-999999: "); //Making sure the user is using the program right
        scanf("%d", &a);
    
        if(a < 1 || a > 999999)
        {
            printf("Invalid Entry! Please Try Again!\n"); //The Program will exit if the user enters a number not in range
            exit(0);
        }
    
    return a; //Program will continue if the user enter a number within the range
}

void display(int y)
{
    int sub = y;
    int sum1=0; //This will add up all the digits in the numbers
    int a; //This one already stores the number the user entered
    
    
        while(sub > 0)
        {
            a = sub % 10;
            sum1 = sum1 + a;
            printf("%d\n", a);
            sub = sub/10;
        }
   
    
    if(sum1 % 9 == 0) //Checking if the sum of all the digits
    {
        printf("%d is divisible by 9.\n", y);
    }
    else
        printf("%d digits is not divisible by 9.\n", y);
}


