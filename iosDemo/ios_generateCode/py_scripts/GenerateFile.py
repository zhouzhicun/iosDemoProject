
# -*- coding: utf-8 -*-

import os
import types
import datetime

import OCClassInfo
import CodeTemplate
import GenerateMethod



def fileDescInfo(projectName, curDate, classInfo):

    file_desc = CodeTemplate.templateDic[CodeTemplate.templateKey_file_desc]
    return file_desc % (classInfo.clsName, projectName, curDate)


def propertyDefine(ocClsInfo):

    property_desc = CodeTemplate.templateDic[CodeTemplate.templateKey_property]

    body = ''
    for item in ocClsInfo.propertyArr:

        propertyClassName = item[0]
        propertyName = item[1]

        body += property_desc % (propertyClassName, propertyName)

    return body



def headerFile(projectName, curDate, ocClsInfo):

    fileName = ocClsInfo.clsName + '.h'

    baseClsName = ocClsInfo.baseClsName
    clsName = ocClsInfo.clsName

    fileDesc = fileDescInfo(projectName, curDate, ocClsInfo)
    propertyDesc = propertyDefine(ocClsInfo)

    if ocClsInfo.type == OCClassInfo.classType_viewcontroller:
        headerFileTemplate = CodeTemplate.templateDic[CodeTemplate.templateKey_vc_header_file]
        vmClsName = clsName[:-1] + "M"
        body = headerFileTemplate % (fileDesc, baseClsName, vmClsName, clsName, baseClsName, vmClsName, vmClsName, propertyDesc)
    else:
        headerFileTemplate = CodeTemplate.templateDic[CodeTemplate.templateKey_header_file]
        body = headerFileTemplate % (fileDesc, baseClsName, clsName, baseClsName, propertyDesc)

    return (fileName, body)



def ImplementFile(projectName, curDate, ocClsInfo):

    fileName = ocClsInfo.clsName + '.m'

    baseClsName = ocClsInfo.baseClsName
    clsName = ocClsInfo.clsName

    if ocClsInfo.type == OCClassInfo.classType_viewcontroller:
        implementFileTemplate = CodeTemplate.templateDic[CodeTemplate.templateKey_vc_implement_file]
    else:
        implementFileTemplate = CodeTemplate.templateDic[CodeTemplate.templateKey_implement_file]

    fileDesc = fileDescInfo(projectName, curDate, ocClsInfo)
    uiMethodDesc = GenerateMethod.UIMethod(ocClsInfo)
    setterDesc = GenerateMethod.SetMethod(ocClsInfo)

    body = ""
    if ocClsInfo.type == OCClassInfo.classType_cell:
        #cell
        otherMethodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_cell_otherMethod]
        body = implementFileTemplate % (fileDesc, clsName, clsName, clsName, uiMethodDesc + otherMethodDesc + setterDesc)
    elif ocClsInfo.type == OCClassInfo.classType_view:
        #view
        otherMethodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_view_otherMethod]
        body = implementFileTemplate % (fileDesc, clsName, clsName, clsName, uiMethodDesc + otherMethodDesc + setterDesc)
    elif ocClsInfo.type == OCClassInfo.classType_viewcontroller:
        #viewcontroller
        vmClsName = clsName[:-1]+"M"
        otherMethodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_viewcontroller_otherMethod]
        body = implementFileTemplate % (fileDesc, clsName, clsName, clsName, vmClsName, uiMethodDesc + otherMethodDesc + setterDesc)
    elif ocClsInfo.type == OCClassInfo.classType_viewmodel:
        #viewmodel
        otherMethodDesc = CodeTemplate.templateDic[CodeTemplate.templateKey_viewmodel_otherMethod]
        body = implementFileTemplate % (fileDesc, clsName, clsName, clsName, otherMethodDesc)

    return (fileName, body)



