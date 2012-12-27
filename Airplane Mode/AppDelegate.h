//
//  AppDelegate.h
//  Airplane Mode
//
//  Created by jnlin on 12/12/27.
//  Copyright (c) 2012 jnlin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreWLAN/CoreWLAN.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
    
    IBOutlet NSMenuItem *on;
    IBOutlet NSMenuItem *off;
    IBOutlet NSMenuItem *exit;
}

@end
