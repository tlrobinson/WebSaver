//
//  WebSaverView.m
//  WebSaver
//
//  Created by Thomas Robinson on 10/13/09.
//  Modified by Pekka Nikander in May 2012.
//  Copyright (c) 2013, Thomas Robinson. All rights reserved.
//  Copyright (c) 2012, Senseg.  All rights reserved.
//

#import "WebSaverView.h"

#import <WebKit/WebKit.h>

#define REFRESH_DISABLED 0
#define REFRESH_SECONDS 1
#define REFRESH_MINUTES 2
#define REFRESH_HOURS 3

@implementation WebSaverView

static NSString * const ModuleName = @"com.github.tlrobinson.WebSaver";

static NSString * const URL_KEY = @"URL";
static NSString * const USERSCRIPT_KEY = @"UserScript";
static NSString * const REFRESH_INTERVAL_KEY = @"RefreshInterval";
static NSString * const REFRESH_UNITS_KEY = @"RefreshUnits";

static NSString * const DEFAULT_URL = @"http://webglsamples.googlecode.com/hg/aquarium/aquarium.html";
static NSString * const DEFAULT_USERSCRIPT = @"/*document.body.style.backgroundColor = 'green';*/";
static double const DEFAULT_REFRESH_INTERVAL = 1.0;
static long const DEFAULT_REFRESH_UNITS = REFRESH_MINUTES;

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        refreshTimer = nil;

		defaults = [ScreenSaverDefaults defaultsForModuleWithName:ModuleName];

		[defaults registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:
									DEFAULT_URL, URL_KEY,
                                    DEFAULT_USERSCRIPT, USERSCRIPT_KEY,
                                    [NSNumber numberWithDouble:DEFAULT_REFRESH_INTERVAL], REFRESH_INTERVAL_KEY,
                                    [NSNumber numberWithLong:DEFAULT_REFRESH_UNITS], REFRESH_UNITS_KEY,
									nil]];

		webView = [[WebView alloc] initWithFrame:[self bounds] frameName:nil groupName:nil];
        WebPreferences *p = [webView preferences];
        if ([p respondsToSelector:@selector(setWebGLEnabled:)]) {
            [p setWebGLEnabled:YES];
        }
        [webView setFrameLoadDelegate:self];
		[self addSubview:webView];

        [self loadWebView];
    }
    return self;
}

- (BOOL)hasConfigureSheet
{
	return YES;
}

- (NSString *)url
{
    return [defaults valueForKey: URL_KEY];
}
- (long)refreshUnits
{
    return [(NSNumber *)[defaults valueForKey:REFRESH_UNITS_KEY] longValue];
}
- (double)refreshInterval
{
    return [(NSNumber *)[defaults valueForKey:REFRESH_INTERVAL_KEY] doubleValue];
}
- (NSString *)userScript
{
    return [defaults valueForKey:USERSCRIPT_KEY];
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

	[url setStringValue:[self url]];
	[refreshInterval setDoubleValue:[self refreshInterval]];
    [refreshUnits selectItemWithTag:[self refreshUnits]];
	[[userScript textStorage] setAttributedString:[[NSAttributedString alloc] initWithString:[self userScript]]];

    [self updatePanel];

	return configSheet;
}

- (void)updatePanel
{
    [refreshInterval setEnabled:[[refreshUnits selectedItem] tag] > 0];
}

- (void)refreshWebView:(NSTimer*)theTimer
{
    [webView reload:nil];
}

- (void)loadWebView
{
    [webView setMainFrameURL:[defaults valueForKey:URL_KEY]];

    if (refreshTimer)
    {
        [refreshTimer invalidate];
        [refreshTimer release];
        refreshTimer = nil;
    }

    long units = [self refreshUnits];
    NSTimeInterval interval = 0;

    if (units == REFRESH_SECONDS)
        interval = [self refreshInterval];
    else if (units == REFRESH_MINUTES)
        interval = 60 * [self refreshInterval];
    else if (units == REFRESH_HOURS)
        interval = 60 * 60 * [self refreshInterval];

    if (interval > 0)
    {
        refreshTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(refreshWebView:) userInfo:nil repeats:YES];
    }
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    [sender stringByEvaluatingJavaScriptFromString:[defaults valueForKey:USERSCRIPT_KEY]];
}

// IBActions

- (IBAction) okClick:(id)sender
{
	[defaults setValue:[url stringValue] forKey:URL_KEY];
    [defaults setValue:[NSNumber numberWithDouble:[refreshInterval doubleValue]] forKey:REFRESH_INTERVAL_KEY];
    [defaults setValue:[NSNumber numberWithLong:[[refreshUnits selectedItem] tag]] forKey:REFRESH_UNITS_KEY];
    [defaults setValue:[[userScript textStorage] string] forKey:USERSCRIPT_KEY];
	[defaults synchronize];

	[[NSApplication sharedApplication] endSheet:configSheet];

    [self loadWebView];
}
- (IBAction)cancelClick:(id)sender
{
	[[NSApplication sharedApplication] endSheet:configSheet];
}
- (IBAction)changeRefreshUnits:(id)sender
{
    [self updatePanel];
}


@end
