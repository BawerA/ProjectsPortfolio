//
//  main.c
//  hw1
//
//  Created by Bawer Alissa on 6/29/18.
//  Copyright © 2018 Bawer Alissa. All rights reserved.
//  G00974209


#include <stdio.h>
int main()
{
    int number;
    
    printf("Enter an integer: ");
    scanf("%d",&number);
    
    
    //Is number negative,positive,or zero?
    if (number<0)
    {
        printf("%d is a negative number.\n",number);
    }
    else if (number==0){
        printf("%d equals to zero.\n",number);
    }
    else {
        printf("%d is a positive number.\n",number);
    }
    // Is number odd or even?
    
    
    if (number % 2 == 0)
    {
        printf("%d is a even number.\n",number);
    }
    else if (number % 2 !=0) {
        printf("%d is an odd number.\n",number);
    }
    else {
        printf("%d is zero.\n",number);
    }
    
    return 0;
    
}
