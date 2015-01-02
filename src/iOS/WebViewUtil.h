//
//  WebViewUtil.h
//  TestSnapshot
//
//  Created by DannyYang on 2014/12/23.
//  Copyright (c) 2014年 webcomm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface WebViewUtil : NSObject
+ (UIImage *)takeScreenshotFromWebview:(UIWebView *)webView;
@end
