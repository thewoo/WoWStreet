//
//  Spell.m
//  WoWStreet
//
//  Created by Jorge Pardo on 14/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "Spell.h"

@implementation Spell

@synthesize name;
@synthesize damage;
@synthesize description;

@synthesize spellsRunes;


#pragma mark Object's.

- (id)init {
    
    self = [super init];
    if (self) {
        self.spellsRunes = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
