# -*- coding: utf-8 -*-
# @Time    : 2019/8/11 21:57
# @Author  : Sheng Zhang
# @Site    : 
# @File    : Intekey_Crack.py
# @Software: PyCharm

import os
import argparse

class IntekeyCrack():

    def __init__(self,workdir):
        self.__crackdir = workdir
        self.__crack(self.__crackdir)


    def __crack(self, dir):

        print("cracking into"+dir)
        dirContents = os.listdir(dir)
        content_num = len(dirContents)

        if(content_num==0):
            print (dir+'is an empty folder')
        else:
            for item_index in range(content_num):
                item = dirContents[item_index]
                item_dir = os.path.join(dir,item)

                if(os.path.isdir(item_dir)):
                    self.__crack(item_dir)

                if(os.path.isfile(item_dir)):
                    self.__fileoperation(item_dir)

    def __fileoperation(self, filedir):

        old_name = filedir
        if(filedir.endswith('.cCrack')):
            new_name = filedir.replace('.cCrack', '.c', 1)
            os.rename(old_name, new_name)

        if(filedir.endswith('.hCrack')):
            new_name = filedir.replace('.hCrack', '.h', 1)
            os.rename(old_name, new_name)

        if (filedir.endswith('.sCrack')):
            new_name = filedir.replace('.sCrack', '.s', 1)
            os.rename(old_name, new_name)

        if(filedir.endswith('.asmCrack')):
            new_name = filedir.replace('.asmCrack', '.asm', 1)
            os.rename(old_name, new_name)

        if(filedir.endswith('.mCrack')):
            new_name = filedir.replace('.mCrack', '.m', 1)
            os.rename(old_name, new_name)


if __name__ == "__main__":

    parser = argparse.ArgumentParser(prog="\n\rIntekey Crack tool",
									 epilog="\n\rSheng Zhanggggggg")

    parser.add_argument('-d', '--dir',  help="\n\rSpicify the Crack dir.",
										required=True)
    args = parser.parse_args()

    mcrack = IntekeyCrack(args.dir)









