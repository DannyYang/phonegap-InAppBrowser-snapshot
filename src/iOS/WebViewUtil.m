//
//  WebViewUtil.m
//  TestSnapshot
//
//  Created by DannyYang on 2014/12/23.
//  Copyright (c) 2014年 webcomm. All rights reserved.
//

#import "WebViewUtil.h"

@implementation WebViewUtil
+ (UIImage *)takeScreenshotFromWebview:(UIWebView *)webView{
    UIImage *img = nil;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0"))
    {
        UIGraphicsBeginImageContextWithOptions(webView.scrollView.contentSize, webView.scrollView.opaque, 0.0);
        {
            CGPoint savedContentOffset = webView.scrollView.contentOffset;
            CGRect savedFrame = webView.scrollView.frame;
            
            webView.scrollView.contentOffset = CGPointZero;
            webView.scrollView.frame = CGRectMake(0, 0, webView.scrollView.contentSize.width, webView.scrollView.contentSize.height);
            [webView.scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
            img = UIGraphicsGetImageFromCurrentImageContext();
            
            webView.scrollView.contentOffset = savedContentOffset;
            webView.scrollView.frame = savedFrame;
        }
        UIGraphicsEndImageContext();
    }
    else
    {
        for (id subview in webView.subviews)
        {
            if ([subview isKindOfClass:[UIScrollView class]])
            {
                UIScrollView *scrollView = (UIScrollView *)subview;
                UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.opaque, 0.0);
                {
                    CGPoint savedContentOffset = scrollView.contentOffset;
                    CGRect savedFrame = scrollView.frame;
                    
                    scrollView.contentOffset = CGPointZero;
                    scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
                    [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
                    img = UIGraphicsGetImageFromCurrentImageContext();
                    
                    scrollView.contentOffset = savedContentOffset;
                    scrollView.frame = savedFrame;
                }
                UIGraphicsEndImageContext();
            }
        }
    }
    return img;
}
@end
