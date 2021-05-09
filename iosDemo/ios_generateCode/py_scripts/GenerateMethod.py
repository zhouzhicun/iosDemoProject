
# -*- coding: utf-8 -*-

import os
import types
import datetime


import ClassInfo
import CodeTemplate



def UIMethod(ocClassInfo):

    setupViewBodyDesc = setupViewMethodBody(ocClassInfo)
    setupConstraintDesc = setupConstraintMethodBody(ocClassInfo)
    setupEventMethodDesc = setupEventMethodBody(ocClassInfo)

    uiMethodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_view_UIMethod]

    desc = "#pragma mark - UI \n\n"
    desc += uiMethodDesc % (setupViewBodyDesc, setupConstraintDesc, setupEventMethodDesc)
    return desc


def SetMethod(ocClassInfo):

    setMethodDesc = ''
    for propertyItem in ocClassInfo.propertyArr:

        propertyClassName = propertyItem[0]
        propertyName = propertyItem[1]

        tempClsName = propertyClassName.lower()
        if tempClsName.endswith("label"):
            setMethodDesc += createLabel(propertyClassName, propertyName)
        elif tempClsName.endswith("imageview"):
            setMethodDesc += createImageView(propertyClassName, propertyName)
        elif tempClsName.endswith("button"):
            setMethodDesc += createButton(propertyClassName, propertyName)
        elif tempClsName.endswith("textfield"):
            setMethodDesc += createTextField(propertyClassName, propertyName)
        else:
            setMethodDesc += createView(propertyClassName, propertyName)

    desc = "#pragma mark - Setter \n\n"
    return desc + setMethodDesc







######################### set方法 #############################

def createView(ocClassName, propertyName):

    methodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIView]
    return methodDesc % (ocClassName, propertyName, propertyName, propertyName, ocClassName, "", propertyName)


def createLabel(ocClassName, propertyName):

    methodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIView]

    bodyDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UILabel]
    bodyDesc = bodyDesc % (propertyName)

    return methodDesc % (ocClassName, propertyName, propertyName, propertyName, ocClassName, bodyDesc, propertyName)


def createImageView(ocClassName, propertyName):

    methodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIView]

    bodyDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIImageView]
    bodyDesc = bodyDesc % (propertyName)

    return methodDesc % (ocClassName, propertyName, propertyName, propertyName, ocClassName, bodyDesc, propertyName)


def createButton(ocClassName, propertyName):

    methodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIView]

    bodyDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIButton]
    bodyDesc = bodyDesc % (propertyName, propertyName)

    return methodDesc % (ocClassName, propertyName, propertyName, propertyName, ocClassName, bodyDesc, propertyName)



def createTextField(ocClassName, propertyName):

    methodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UIView]

    bodyDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_set_method_UITextField]
    bodyDesc = bodyDesc % (propertyName)

    return methodDesc % (ocClassName, propertyName, propertyName, propertyName, ocClassName, bodyDesc, propertyName)








######################### UI方法 #############################


def setupViewMethodBody(classInfo):

    addViewDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_view_addview]
    if classInfo.type == ClassInfo.classType_cell:
        #cell
        addViewDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_cell_addview]
    elif classInfo.type == ClassInfo.classType_view:
        #view
        addViewDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_view_addview]
    elif classInfo.type == ClassInfo.classType_viewcontroller:
        #viewController
        addViewDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_viewcontroller_addview]

    methodBodyDesc = ''
    for propertyItem in classInfo.propertyArr:
        methodBodyDesc += addViewDesc % propertyItem[1]

    return methodBodyDesc




def setupConstraintMethodBody(classInfo):

    makeConstraintDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_view_makeConstraint]

    methodBodyDesc = ''
    for propertyItem in classInfo.propertyArr:
        methodBodyDesc += makeConstraintDesc % propertyItem[1]

    return methodBodyDesc



def setupEventMethodBody(classInfo):

    return ""



