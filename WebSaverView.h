//
//  WebSaverView.h
//  WebSaver
//
//  Created by Thomas Robinson on 10/13/09.
//  Modified by Pekka Nikander in May 2012.
//  Copyright (c) 2013, Thomas Robinson. All rights reserved.
//  Copyright (c) 2012, Senseg.  All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

#import <WebKit/WebKit.h>

@interface WebSaverView : ScreenSaverView 
{
	IBOutlet id configSheet;

	IBOutlet NSTextField *url;
	IBOutlet NSTextView *userScript;
	IBOutlet NSTextField *refreshInterval;
	IBOutlet NSPopUpButton *refreshUnits;

    ScreenSaverDefaults *defaults;
	WebView *webView;
    NSTimer *refreshTimer;
}

- (void)loadWebView;

- (IBAction)changeRefreshUnits:(id)sender;

@end
