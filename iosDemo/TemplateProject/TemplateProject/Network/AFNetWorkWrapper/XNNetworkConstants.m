//
//  XNNetworkConstants.m
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "XNNetworkConstants.h"


NSString *getReqMethodDesc(XNRequestMethod reqMethod) {
    NSString *desc = nil;
    switch (reqMethod) {
        case XNRequestMethodGet: {
            desc = @"GET";
            break;
        }
        case XNRequestMethodPost: {
            desc = @"POST";
            break;
        }
        case XNRequestMethodPut: {
            desc = @"PUT";
            break;
        }
        case XNRequestMethodDelete: {
            desc = @"DELETE";
            break;
        }
    }
    return desc;
}
