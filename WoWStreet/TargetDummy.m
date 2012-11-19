//
//  TargetDummy.m
//  WoWStreet
//
//  Created by Jorge Pardo on 07/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "TargetDummy.h"

@implementation TargetDummy

@synthesize health;
@synthesize maxHealth;

#pragma mark Object's.

-(id)init {
    
    self = [super init];
    
    if (self) {
        self.health = 4000;
        self.maxHealth = 4000;
    }
    
    return self;
}


@end
