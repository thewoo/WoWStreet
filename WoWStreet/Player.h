//
//  Player.h
//  WoWStreet
//
//  Created by Jorge Pardo on 20/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int level;
@property (nonatomic) int experience;

+(Player *)Get;


@end
