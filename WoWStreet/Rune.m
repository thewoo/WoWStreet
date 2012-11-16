//
//  Rune.m
//  WoWStreet
//
//  Created by Jorge Pardo on 12/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "Rune.h"
#import "Points.h"

@implementation Rune

@synthesize Id;
@synthesize name;
@synthesize runePoints;

#pragma mark Actions.

-(void)printAllRunePoints {
    
    for (Points *p in runePoints) {
        
        NSLog(@"x: %f", p.x);
        NSLog(@"y: %f", p.y);
    }
}

+(BOOL)compareRunesIDsFromRunes:(NSMutableArray *)a andRunes:(NSMutableArray *)b {
    
    BOOL success = YES;
    
    for (int x=0; x < [a count]; x++) {
        
        if ([a objectAtIndex:x] != [b objectAtIndex:x]) {
            success = NO;
            break;
        }
    }
    
    return success;   
}




#pragma mark NSOBject's.

- (id)init {
    
    self = [super init];
    if (self) {
        self.runePoints = [[NSMutableArray alloc] init];
    }    
    return self;
}



@end
