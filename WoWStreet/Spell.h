//
//  Spell.h
//  WoWStreet
//
//  Created by Jorge Pardo on 14/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Spell : NSObject

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *damage;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSMutableArray *spellsRunes;



@end
