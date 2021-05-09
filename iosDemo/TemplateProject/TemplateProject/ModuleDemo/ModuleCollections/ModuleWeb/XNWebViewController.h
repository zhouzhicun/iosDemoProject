//
//  XNWebViewController.h
//  TemplateProject
//
//  Created by zzc on 2020/1/8.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseViewController.h"
#import "WebViewJavascriptBridge.h"

@interface XNWebViewController : XNBaseViewController <WKNavigationDelegate>


@property(nonatomic, strong)WKWebView *webView;
@property(nonatomic, strong)WebViewJavascriptBridge *bridge;

//url字符串
@property(nonatomic, copy)NSString *urlString;


@end
