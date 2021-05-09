


# -*- coding: utf-8 -*-

import os
import types
import datetime

classType_cell = 1
classType_view = 2
classType_viewcontroller = 3
classType_viewmodel = 4

class OCClassInfo:

    def __init__(self, baseClsName, clsName):
        self.type = classType_cell
        self.clsName = clsName
        self.baseClsName = baseClsName
        self.propertyArr = []

        tempName = clsName
        if tempName.endswith("Cell"):
            self.type = classType_cell
        elif tempName.endswith("View"):
            self.type = classType_view
        elif tempName.endswith("VC"):
            self.type = classType_viewcontroller
        elif tempName.endswith("VM"):
            self.type = classType_viewmodel



