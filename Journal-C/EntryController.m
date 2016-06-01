//
//  EntryController.m
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString * const kEntries = @"entries";

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        [sharedInstance loadFromPersistentStorage];
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
    [self saveToPersistentStorage];
}

- (void)removeEntry:(Entry *)entry {
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:kEntries];
}

- (void)loadFromPersistentStorage {
    
    NSMutableArray *entries = [NSMutableArray new];
    
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:kEntries];
    
    for (NSDictionary *dictionary in entryDictionaries) {
        
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [entries addObject:entry];
    }
    
    self.entries = entries;
}


@end
