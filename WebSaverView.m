//
//  WebSaverView.m
//  WebSaver
//
//  Created by Thomas Robinson on 10/13/09.
//  Copyright (c) 2009, 280 North. All rights reserved.
//

#import "WebSaverView.h"

#import <WebKit/WebKit.h>

@implementation WebSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
		webView = [[WebView alloc] initWithFrame:[self bounds] frameName:nil groupName:nil];
		[webView setMainFrameURL:[NSString stringWithFormat:@"file://%@/index.html", [[NSBundle bundleForClass:[self class]] resourcePath]]];
		[self addSubview:webView];
    }
    return self;
}

- (BOOL)hasConfigureSheet
{
	return YES;
}

- (NSWindow *)configureSheet
{
	if (!configSheet)
	{
		if (![NSBundle loadNibNamed:@"ConfigureSheet" owner:self])
		{
			NSLog( @"Failed to load configure sheet." );
			NSBeep();
		}
	}

	return configSheet;
}

- (IBAction)cancelClick:(id)sender
{
	[[NSApplication sharedApplication] endSheet:configSheet];
}

@end
