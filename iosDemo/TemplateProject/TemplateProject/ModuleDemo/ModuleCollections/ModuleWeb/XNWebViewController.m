//
//  XNWebViewController.m
//  TemplateProject
//
//  Created by zzc on 2020/1/8.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNWebViewController.h"


#ifdef DEBUG

@interface NSURLRequest (XNUIWebSSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString *)host;
@end

@implementation NSURLRequest (XNUIWebSSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host { return YES; }
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString *)host {}
@end

#endif



@interface XNWebViewController ()

@end

@implementation XNWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.bridge) {
        return;
    }
    
    //1. 创建
    [self createWKWebView];
    
    [self renderButtons];
    
    //3. 加载
    [self load];
}

- (void)createWKWebView {
    
    WKWebView* webView = [[NSClassFromString(@"WKWebView") alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    [WebViewJavascriptBridge enableLogging];
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
    [self.bridge setWebViewDelegate:self];
    
    [self.bridge registerHandler:@"testObjcCallback" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"testObjcCallback called: %@", data);
        responseCallback(@"Response from testObjcCallback");
    }];
    
    [self.bridge callHandler:@"testJavascriptHandler" data:@{ @"foo":@"before ready" }];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidStartLoad");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidFinishLoad");
}


- (void)load
{
    if (!self.urlString) {
        return;
    }
    
    if ([self.urlString hasPrefix:@"http"]) {
        NSURL *url = [NSURL URLWithString:self.urlString];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    } else {
        NSString* appHtml = [NSString stringWithContentsOfFile:self.urlString encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:self.urlString];
        [self.webView loadHTMLString:appHtml baseURL:baseURL];
    }
}


#pragma mark -


- (void)renderButtons {
    UIFont* font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
     
    UIButton *callbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [callbackButton setTitle:@"Call handler" forState:UIControlStateNormal];
    [callbackButton addTarget:self action:@selector(callHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callbackButton];
    callbackButton.frame = CGRectMake(10, 400, 100, 35);
    callbackButton.titleLabel.font = font;
    
    UIButton* reloadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [reloadButton setTitle:@"Reload webview" forState:UIControlStateNormal];
    [reloadButton addTarget:self.webView action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadButton];
    reloadButton.frame = CGRectMake(110, 400, 100, 35);
    reloadButton.titleLabel.font = font;
}

- (void)callHandler:(id)sender {
    id data = @{ @"greetingFromObjC": @"Hi there, JS!" };
     [self.bridge callHandler:@"testJavascriptHandler" data:data responseCallback:^(id response) {
        NSLog(@"testJavascriptHandler responded: %@", response);
    }];
}

@end
