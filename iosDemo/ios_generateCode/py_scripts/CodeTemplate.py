# -*- coding: utf-8 -*-

import os
import types
import datetime

templateKey_file_desc = "file_desc"
templateKey_property = "property"


##addsubview
templateKey_view_addview = "view_addview"
templateKey_cell_addview = "cell_addview"
templateKey_viewcontroller_addview = "viewcontroller_addview"


##约束
templateKey_view_makeConstraint = "view_makeConstraint"


##Setter方法
templateKey_set_method_UIView = "set_method_UIView"
templateKey_set_method_UILabel = "set_method_UILabel"
templateKey_set_method_UIImageView = "set_method_UIImageView"
templateKey_set_method_UIButton = "set_method_UIButton"
templateKey_set_method_UITextField = "set_method_UITextField"

##UIMethod
templateKey_view_UIMethod = "view_UIMethod"

##其他方法
templateKey_viewcontroller_otherMethod = "viewcontroller_otherMethod"
templateKey_viewmodel_otherMethod = "viewmodel_otherMethod"
templateKey_cell_otherMethod = "cell_otherMethod"
templateKey_view_otherMethod = "view_otherMethod"

##文件模板
templateKey_header_file = "header_file"
templateKey_implement_file = "implement_file"

##vc文件模板
templateKey_vc_header_file = "vc_header_file"
templateKey_vc_implement_file = "vc_implement_file"





templateDic = {}


def parse():

    global templateDic

    #读取文件
    fp = open('CodeTemplate.txt', 'r')
    lines = fp.readlines()
    fp.close()

    templateName = ""
    templateCode = ""

    #是否开始
    beginFlag = False

    # 开始解析代码模板文件
    for line in lines:

        tempLine = line.strip()

        #忽略#开头的注释行
        if tempLine.startswith("###"):
            continue

        if tempLine == "begin":

            #开始解析某个模板
            templateName = ""
            templateCode = ""
            beginFlag = True
            continue

        elif tempLine == "end":

            #某个模板解析结束
            templateDic[templateName] = templateCode
            beginFlag = False
            continue


        #开始解析某个节点
        if beginFlag:

            ##如果还没获取到模板名,且当前行为空行，则忽略该行, 并继续下一行
            if templateName == "" and tempLine == "":
                continue

            if templateName == "":
                templateName = tempLine
            else:
                templateCode += line


    # print "所有模板名 : %s" % templateDic.keys()
    # for templateName in templateDic.keys():
    #     print('%s:\n%s' % (templateName, templateDic[templateName]))







