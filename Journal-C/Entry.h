//
//  Entry.h
//  Journal-C
//
//  Created by Skylar Hansen on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timeStamp;

- (instancetype)initWithTitle:(NSString *)title andText:(NSString *)text;

@end
