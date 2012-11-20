//
//  Player.m
//  WoWStreet
//
//  Created by Jorge Pardo on 20/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "Player.h"

static Player *instance = nil;

@implementation Player

@synthesize name;
@synthesize level;
@synthesize experience;


#pragma mark Singleton's.

+(Player *)Get {
    
    if (instance == nil) {
        instance = [[Player alloc] init];
    }
    
    return instance;
}


#pragma mark Object's.

- (id)init {
    
    self = [super init];
    if (self) {
        
        
    }
    return self;
}


@end
