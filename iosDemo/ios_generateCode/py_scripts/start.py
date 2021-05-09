
# -*- coding: utf-8 -*-

import os
import types
import datetime
import re

import OCClassInfo
import CodeTemplate
import GenerateFile



projectName = "TestABC"
curDate = datetime.datetime.now().strftime("%Y/%m/%d")



def createFilePath(filePath):

    # 如果目录不存在，则创建
    if not os.path.exists(filePath):
        os.makedirs(filePath)


def createFile(fileName, body):

    # 创建文件
    fp = open(fileName, 'w')
    fp.write(body)
    fp.close()



def generateFile(ocClsInfo):
    #如果classInfo为空，直接返回，不做任何处理
    if ocClsInfo is None:
        return

    if ocClsInfo.type == OCClassInfo.classType_viewcontroller:

        #创建VC
        createClassFile(ocClsInfo)

        #创建VM
        ocClsInfo.type = OCClassInfo.classType_viewmodel
        ocClsInfo.baseClsName = "XNLBaseViewModel"
        ocClsInfo.clsName = ocClsInfo.clsName[:-1] + "M"
        ocClsInfo.propertyArr = []
        createClassFile(ocClsInfo)

    else:
        createClassFile(ocClsInfo)



def createClassFile(ocClsInfo):

    #如果classInfo为空，直接返回，不做任何处理
    if ocClsInfo is None:
        return

    #构建头文件
    (fileName, body) = GenerateFile.headerFile(projectName, curDate, ocClsInfo)
    createFile(fileName, body)

    #构建实现文件
    (fileName, body) = GenerateFile.ImplementFile(projectName, curDate, ocClsInfo)
    createFile(fileName, body)



def parseClassDescFile(descPath):

    CodeTemplate.parse()

    #保存当前文件所在目录
    rootPath = os.path.dirname(descPath)

    #读取文件
    fp = open(descPath, 'r')
    lines = fp.readlines()
    fp.close()

    folderPrefix = 'folder'
    classPrefix = 'class'

    clsInfo = None

    for line in lines:

        tempLine = line.strip()

        #如果是空行，则直接跳过
        if tempLine == "":
            continue

        #按'|'拆分(例如: aaa|bbb)
        arr = tempLine.split("|")
        if len(arr) < 2 or len(arr) > 3 :
            print ("类描述文件格式不对，解析失败");
            print ("当前出错行: %s", tempLine)
            break


        if re.match(folderPrefix, tempLine) :

            # 如果clsInfo已存在，则创建对应的.h.m文件
            generateFile(clsInfo)
            clsInfo = None

            #解析目录名，并创建该目录
            folder = arr[1]
            curPath = rootPath + '/' + folder.strip()
            createFilePath(curPath)

            #cd到该目录
            os.chdir(curPath)

        elif re.match(classPrefix, tempLine) :

            #class节点，则表示创建新类
            #如果clsInfo已存在，则创建对应的.h.m文件
            generateFile(clsInfo)
            clsInfo = None

            #类名
            baseClsName = arr[1]
            clsName = arr[2]
            clsInfo = OCClassInfo.OCClassInfo(baseClsName, clsName)

        else:
            #属性定义
            clsInfo.propertyArr.append(arr)


    #定义文件中的最后一个类
    generateFile(clsInfo)






def main():

    src_from = raw_input("请输入类描述文件, 将类描述文件直接拖入控制台即可\n")

    src_from = src_from.strip()

    #解析类描述文件
    parseClassDescFile(src_from)

    exit()

main()






