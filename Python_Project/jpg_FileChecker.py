''' CFRS 510
	Python Module Template
	
	Author name: Bawer Alissa
	Assignment #: HW3 Hashing Python
	
	Description:  This program will scan the content within the folder and check if the files are a JPG, if it is a JPG then it will print 
                  out the Hash and the MAC time of the JPG.
    
    '''
    
import os
import sys
from hashlib import md5
import re
import csv
import platform
import hashlib
import os.path, time
import subprocess
import json
'''
This part of the code will require the user to input the directory of the folder that is containting all the files
user_input = input("Enter the path of the folder with all your files:")
print(user_input) #Testing to see if the input is the correct one
entries = os.listdir(user_input)
A for loop that will create the directories with each file and read them one by one'''

#This is the main function of the code, this is where the user will input and check if the files in the folder has any JPG 
# Where it will print out the hashes and MAC time for each of the JPG files

start_time = time.time()

def main():
    user_input = input("Enter the directory of the folder:")
    
    #These set of if statements will check if the user did not make any mistakes when entering the output
    #If the user did not enter any correct statements it will return the main function and restart the code
    if user_input == "":
        print("Nothing was entered! Please enter the full directory of the folder.")
        return main()
    forward_slash = "\\"
    drive = ":"
    
    if (forward_slash and drive not in user_input):
        print("This is not a correct directory, please try again.")
        return main()
    
    #Entries will enter the user_input directory and turn it to a real directory for the code to read
    folder = os.listdir(user_input)
    
    #orig_stdout, sys.stdout and text file is the part of the code that will print the output into the text file named Output.txt
    orig_stdout = sys.stdout
    text_file = open(user_input + str('\\') + "Output.txt","a")
    sys.stdout = text_file
    
    #jpg_string is the byte required for a file to be considered a JPG
    jpg_string = b"\xff\xd8\xff"
    
    #The for loop will take every file in the folder and will see if the file is a JPG
    #If it is a JPG the text file will print the hash and the MAC time
    #If it is not a JPG the code will skip it and go to the next file.
    for files in folder:
        user_dir = (user_input + str('\\') + files)
        dir_file2 = open(user_dir,'rb+').read(20)
        
        #This if statement in the for loop will check if the file is a JPG file
        #If the file is a jpg file it will continue the code and print out the outputs if not then it will be skipped.
        if (jpg_string not in dir_file2):
            continue
        
        #This part of the code will print out if the file is a JPG
        #It will print out the file name and directory
        print("File: " + files + "\n" + "Directory: " + user_input +str('\\') + files)
        
        #This part of the code is taken from the sha256HashFunc Function -- see below for more details
        sha256HashFunc(user_dir)
        
        #It will also print out the MAC time as well.
        print("Last modified:", time.ctime(os.path.getmtime(user_dir)))
        print("Created:", time.ctime(os.path.getctime(user_dir)))
        print("Last access:", time.ctime(os.path.getatime(user_dir)) + "\n")
        
    #This part will close out the text file and print it out in the directory you opened the folder in once the loop is over
    sys.stdout = orig_stdout
    text_file.close()
    
    print("It took %s seconds to complete the execution of the code.\n" % (time.time() - start_time))
    print("The text file AlissaOutput.txt was created in " + user_input +". " + "Please check the folder to look at the text file.")
    
    
#This function will take the file of the JPG and create the sha256 Hash value into the text file.
def sha256HashFunc(files):
    sha256_hash = hashlib.sha256()
    print(files)
    with open(files,"rb") as f:
        for byte_block in iter(lambda: f.read(4096),b""):
            sha256_hash.update(byte_block)
        print("Hash: " + sha256_hash.hexdigest())
    
#This will run the main function of the code
#Testing if docstrings print.
if __name__ == '__main__':
    main()