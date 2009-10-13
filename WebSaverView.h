//
//  WebSaverView.h
//  WebSaver
//
//  Created by Thomas Robinson on 10/13/09.
//  Copyright (c) 2009, 280 North. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

#import <WebKit/WebKit.h>

@interface WebSaverView : ScreenSaverView 
{
	WebView *webView;
}

@end
