//
//  AppDelegate.m
//  Airplane Mode
//
//  Created by jnlin on 12/12/27.
//  Copyright (c) 2012 jnlin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
}

- (void) awakeFromNib
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"icon" ofType:@"png"];
    NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
    [image setMatchesOnlyOnBestFittingAxis:YES];
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    
    
    [statusItem setImage:image];
    [statusItem setMenu:statusMenu];
    [statusItem setHighlightMode:YES];    
}

- (IBAction)turnOnAirplaneMode:(id)sender
{
    // turn off bluetooth
    IOBluetoothPreferenceSetControllerPowerState(0);
    
    // turn off wifi
    NSError *error = nil;
    CWInterface *wif = [CWInterface interface];
    BOOL setPowerSuccess = [wif setPower:NO error:&error];
    
    // set state
    NSMenuItem *item = (NSMenuItem *) sender;
    [off setState:0];
    [item setState:1];
}

- (IBAction)turnOffAirplaneMode:(id)sender
{
    // turn on bluetooth
    IOBluetoothPreferenceSetControllerPowerState(1);
    
    // turn on wifi
    NSError *error = nil;
    CWInterface *wif = [CWInterface interface];
    BOOL setPowerSuccess = [wif setPower:YES error:&error];
    
    NSMenuItem *item = (NSMenuItem *) sender;
    [on setState:0];
    [item setState:1];
}

@end
