//
//  EntryController.m
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        self.entries = [NSMutableArray new];
    }
    return self;
}

- (void)addEntry:(Entry *)entry {
    [self.entries addObject:entry];
}

- (void)removeEntry:(Entry *)entry {
    [self.entries removeObject:entry];
}


@end
