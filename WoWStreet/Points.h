//
//  Points.h
//  WoWStreet
//
//  Created by Jorge Pardo on 12/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Points : NSObject

@property float x;
@property float y;

+(BOOL)comparePoint:(Points *)point withX:(float)x andY:(float)y;
+(BOOL)comparePoint:(Points *)a andPoint:(Points *)b;

@end
