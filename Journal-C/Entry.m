//
//  Entry.m
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const kTitle = @"title";
static NSString * const kText = @"text";
static NSString * const kTimeStamp = @"timeStamp";

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

- (NSDictionary *)dictionaryCopy {
    
    return @{
             kTitle: self.title,
             kText: self.text,
             kTimeStamp: self.timeStamp
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        _title = dictionary[kTitle];
        _text = dictionary[kText];
        _timeStamp = dictionary[kTimeStamp];
    }
    
    return self;
}

@end
