//
//  Points.m
//  WoWStreet
//
//  Created by Jorge Pardo on 12/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "Points.h"

@implementation Points

@synthesize x;
@synthesize y;

#pragma mark Actions.

+(BOOL)comparePoint:(Points *)point withX:(float)x andY:(float)y {
    
    if (point.x == x && point.y == y) {
        return true;
    } else {
        return false;
    }
}

+(BOOL)comparePoint:(Points *)a andPoint:(Points *)b {
    
    if (a.x == b.x && a.y == b.y) {
        return true;
    } else {
        return false;
    }
    
}


@end
