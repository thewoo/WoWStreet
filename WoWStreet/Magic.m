//
//  Magic.m
//  WoWStreet
//
//  Created by Jorge Pardo on 20/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "Magic.h"
#import "Rune.h"
#import "Points.h"
#import "SpellsDAO.h"
#import "RunesDAO.h"

@implementation Magic

static Magic *instance = nil;

@synthesize allSpells;
@synthesize allRunes;


-(void)getAllSpells {
    
    self.allSpells = [SpellsDAO getAllSpells];
}

-(Spell *)findSpellWithRunes:(NSMutableArray *)runesArray {
    
    Spell *spell;
    BOOL foundSpell = NO;
    
    for (int x=0; x < [allSpells count]; x++) {
        
        spell = [allSpells objectAtIndex:x];
        
        if ([spell.spellsRunes count] == [runesArray count]) {
            
            if ([Rune compareRunesIDsFromRunes:spell.spellsRunes andRunes:runesArray]) {
                foundSpell = YES;
                break;
            }
        }
        
        if (foundSpell) break;
    }
    
    if (foundSpell) {
        //        NSLog(@"The Spell you've done is: %@", spell.name);
        return spell;
        
    } else {
        return NULL;
    }
}



-(void)getAllRunes {
    
    self.allRunes = [RunesDAO getAllRunes];    
}


-(Rune *)recognizeRune:(NSMutableArray *)runeDrawn {
    
    Rune *rune;
    BOOL foundRune = NO;
    
    for (int x=0; x < [allRunes count]; x++) {
        
        rune = [allRunes objectAtIndex:x];
        
        if ([rune.runePoints count] == [runeDrawn count]) {
            
            for (int y=0; y < [rune.runePoints count]; y++) {
                foundRune = [Points comparePoint:[rune.runePoints objectAtIndex:y] andPoint:[runeDrawn objectAtIndex:y]];
                if (!foundRune) break;
            }
        }
        
        if (foundRune) break;
    }
    
    if (foundRune) {
        //        NSLog(@"You drew the '%@' Rune, with ID: %@", rune.name, rune.Id);
        return rune;
        
    } else {
        return NULL;
    }
}


-(Rune *)findRuneWithID:(NSNumber *)runeId {
    
    Rune *rune = [[Rune alloc] init];
    
    for (Rune *r in allRunes) {
        
        if (r.Id == runeId) {
            rune = r;
            break;
        }
    }
    
    return rune;
}




#pragma mark Singleton's.

+(Magic *)Get {
    
    if (instance == nil) {
        instance = [[Magic alloc] init];
    }
    
    return instance;
}


#pragma mark Object's.

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.allSpells = [[NSMutableArray alloc] init];
        self.allRunes = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
