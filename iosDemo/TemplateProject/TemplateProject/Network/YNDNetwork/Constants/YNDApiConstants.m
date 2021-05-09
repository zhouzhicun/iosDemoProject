//
//  XNApiConstants.m
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "YNDApiConstants.h"
#import "XNHttpClient.h"


/*********************************************************/
//
// 环境baseUrl列表
//
/*********************************************************/

#pragma mark - Default BaseURL
#pragma mark -- 开发, 测试, 预发布环境, 生产

NSString *const XNDefaultServerEnv_Custom      = @"http://192.168.1.1:80";
NSString *const XNDefaultServerEnv_Develop     = @"http://192.168.1.1:80";
NSString *const XNDefaultServerEnv_Test        = @"http://192.168.1.1:80";
NSString *const XNDefaultServerEnv_PreProduct  = @"http://192.168.1.1:80";
NSString *const XNDefaultServerEnv_Product     = @"http://192.168.1.1:80";

NSString *const XNDefaultWebSocketServerEnv_Custom      = @"ws://192.168.1.1:8081/websocket";
NSString *const XNDefaultWebSocketServerEnv_Develop     = @"ws://192.168.1.1:8081/websocket";
NSString *const XNDefaultWebSocketServerEnv_Test        = @"ws://192.168.1.1:8081/websocket";
NSString *const XNDefaultWebSocketServerEnv_PreProduct  = @"ws://192.168.1.1:8081/websocket";
NSString *const XNDefaultWebSocketServerEnv_Product     = @"ws://192.168.1.1:8081/websocket";


#pragma mark - Method

NSString *defaultYNDBaseURL(void) {
    
    XNServerEnvType envType = [XNHttpClient sharedInstance].envType;
    NSString *baseUrl = XNDefaultServerEnv_Product;    //默认初始化
    switch (envType) {
        case XNServerEnvType_Custom: {
            baseUrl = XNDefaultServerEnv_Custom;
            break;
        }
        case XNServerEnvType_Develop: {
            baseUrl = XNDefaultServerEnv_Develop;
            break;
        }
        case XNServerEnvType_Test: {
            baseUrl = XNDefaultServerEnv_Test;
            break;
        }
        case XNServerEnvType_PreProduct: {
            baseUrl = XNDefaultServerEnv_PreProduct;
            break;
        }
        case XNServerEnvType_Product: {
            baseUrl = XNDefaultServerEnv_Product;
            break;
        }
    }
    
    return baseUrl;
}



NSString *defaultYNDWebSocketURL(void) {
    
    XNServerEnvType envType = [XNHttpClient sharedInstance].envType;
    NSString *baseUrl = XNDefaultServerEnv_Product;    //默认初始化
    switch (envType) {
            case XNServerEnvType_Custom: {
                baseUrl = XNDefaultWebSocketServerEnv_Custom;
                break;
            }
            case XNServerEnvType_Develop: {
                baseUrl = XNDefaultWebSocketServerEnv_Develop;
                break;
            }
            case XNServerEnvType_Test: {
                baseUrl = XNDefaultWebSocketServerEnv_Test;
                break;
            }
            case XNServerEnvType_PreProduct: {
                baseUrl = XNDefaultWebSocketServerEnv_PreProduct;
                break;
            }
            case XNServerEnvType_Product: {
                baseUrl = XNDefaultWebSocketServerEnv_Product;
                break;
            }
    }
    
    return baseUrl;
}





/*********************************************************/
//
// API列表
//
/*********************************************************/


//#pragma mark - app更新设置功能
//NSString *const kAPI_App_update = @"/au/info/%@";
//
//#pragma mark - income-return-back-controller
//NSString *const kAPI_irb_coin_list = @"/irb/return_coin_list";
//NSString *const kAPI_irb_pricedure_fee_list = @"/irb/pricedure_fee_list";
//
//#pragma mark - otc接口
//NSString *const kAPI_otc_account_info = @"/o/otc/account_info";
//NSString *const kAPI_otc_addorder = @"/o/otc/addorder";
//NSString *const kAPI_otc_ads_list = @"/o/otc/ads/%@/%@/%@/%@/%@";
//NSString *const kAPI_otc_ads_id = @"/o/otc/ads/%@";
//NSString *const kAPI_otc_confirmGathering = @"/o/otc/confirmGathering";
//NSString *const kAPI_otc_confirmorder = @"/o/otc/confirmorder";
//NSString *const kAPI_otc_is_auth = @"/o/otc/is_auth";
//NSString *const kAPI_otc_orders = @"/o/otc/orders/%@/%@/%@/%@/%@/%@/%@";
//NSString *const kAPI_otc_symbol_ts = @"/o/otc/symbol/%@";
//NSString *const kAPI_otc_ticker_ts = @"/o/otc/ticker/%@";
//
//#pragma mark - 交易排名 : 交易对的交易排名
//NSString *const kAPI_tr_isopen_type = @"/tr/isopen/%@";
//NSString *const kAPI_tr_list = @"/tr/list/%@/%@";
//NSString *const kAPI_tr_search = @"/tr/search/%@";
//
//
//#pragma mark - 会员接口 : 会员注册、账号、密码相关
//NSString *const kAPI_m_addDemand = @"/m/addDemand";
//NSString *const kAPI_m_addDemandLog = @"/m/addDemandLog";
//NSString *const kAPI_m_aliOssPolicy = @"/m/aliOssPolicy";
//NSString *const kAPI_m_apitoken = @"/m/apitoken";
//NSString *const kAPI_m_apitokens = @"/m/apitokens";
//NSString *const kAPI_m_appMemberLogin = @"/m/appMemberLogin";
//NSString *const kAPI_m_assetsLst_ts = @"/m/assetsLst/%@";
//NSString *const kAPI_m_authIdentity = @"/m/authIdentity";
//NSString *const kAPI_m_authindentity = @"/m/authindentity";
//NSString *const kAPI_m_demandList = @"/m/demand/%@/%@";
//NSString *const kAPI_m_forgotV = @"/m/forgotV/%@/%@";
//NSString *const kAPI_m_forgotV2 = @"/m/forgotV2";
