//
//  Entry.m
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(instancetype)initWithTitle:(NSString *)title andText:(NSString *)text {
    self = [super init];
    if (self) {
        self.title = title;
        self.text = text;
        self.timeStamp = [NSDate new];
    }
    return self;
}

@end
