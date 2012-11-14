//
//  SpellsDAO.h
//  WoWStreet
//
//  Created by Jorge Pardo on 14/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Spell.h"

@interface SpellsDAO : NSObject


@property (nonatomic, strong) NSMutableArray *allSpells;

-(void)getAllSpells;
-(Spell *)findSpellWithRunes:(NSMutableArray *)runesArray;

+(SpellsDAO *)Get;

@end
