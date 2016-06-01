//
//  EntryController.h
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong) NSMutableArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;


@end
