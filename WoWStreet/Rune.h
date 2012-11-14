//
//  Rune.h
//  WoWStreet
//
//  Created by Jorge Pardo on 12/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rune : NSObject

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *runePoints;

-(void)printAllRunePoints;

@end
