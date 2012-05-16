//
//  WebSaverView.h
//  WebSaver
//
//  Created by Thomas Robinson on 10/13/09.
//  Modified by Pekka Nikander in May 2012.
//  Copyright (c) 2009, 280 North. All rights reserved.
//  Copyright (c) 2012, Senseg.  All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

#import <WebKit/WebKit.h>

@interface WebSaverView : ScreenSaverView 
{
	IBOutlet id configSheet;
	IBOutlet id url;
	WebView *webView;
}

@end
