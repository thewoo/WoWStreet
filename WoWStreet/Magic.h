//
//  Magic.h
//  WoWStreet
//
//  Created by Jorge Pardo on 20/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Spell.h"
#import "Rune.h"

@interface Magic : NSObject

@property (nonatomic, strong) NSMutableArray *allSpells;
@property (nonatomic, strong) NSMutableArray *allRunes;

-(void)getAllRunes;
-(void)getAllSpells;

-(Spell *)findSpellWithRunes:(NSMutableArray *)runesArray;
-(Rune *)recognizeRune:(NSMutableArray *)runeDrawn;

-(NSString *)findRuneWithID:(NSNumber *)runeId;

+(Magic *)Get;


@end
