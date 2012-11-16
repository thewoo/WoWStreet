//
//  SpellsDAO.m
//  WoWStreet
//
//  Created by Jorge Pardo on 14/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "SpellsDAO.h"
#import "SQLiteManager.h"
#import "Spell.h"
#import "Rune.h"


static SpellsDAO *instance = nil;

@implementation SpellsDAO

@synthesize allSpells;


#pragma mark Actions.

-(void)getAllSpells {
    
    char *allSpellsIdsSQL = "Select distinct spellID from RuneSpells";
    sqlite3_stmt *sqlStatement;
    
    NSMutableArray *spellsIDS = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], allSpellsIdsSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
            [spellsIDS addObject:[NSNumber numberWithInt:sqlite3_column_int(sqlStatement, 0)]];
        }
        
        
        for (int x=0; x< [spellsIDS count]; x++) {
            
            Spell *spell = [[Spell alloc] init];
            
            const char *getAllSpellsSQL = [[NSString stringWithFormat:@"Select Spells.name, Spells.damage, Spells.description, RuneSpells.runeID from Spells, RuneSpells where RuneSpells.spellId = %@", [spellsIDS objectAtIndex:x]] UTF8String];
            
            if (sqlite3_prepare_v2([SQLiteManager getConnection], getAllSpellsSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
                
                spell.Id = [spellsIDS objectAtIndex:x];
                
                while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
                    
                    if (spell.name == nil) spell.name = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(sqlStatement, 0)];
                    if (spell.damage == nil) spell.damage = [NSNumber numberWithInt:sqlite3_column_int(sqlStatement, 1)];
                    if (spell.description == nil) spell.description = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(sqlStatement, 2)];
                    
                    [spell.spellsRunes addObject:[NSNumber numberWithInt:sqlite3_column_int(sqlStatement, 3)]];
                }
                
                [self.allSpells addObject:spell];
            
            } else {
                NSLog(@"[SpellsDAO : getAllSpells] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
            }
        }
        
    } else {        
        NSLog(@"[SpellsDAO : getAllSpells(allSpellsIDS)] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
  
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



#pragma mark Singleton's.

+(SpellsDAO *)Get {
    
    if (!instance) {
        instance = [[SpellsDAO alloc] init];
    }
    
    return instance;
}



#pragma mark Object's.

- (id)init {
    
    self = [super init];
    
    if (self) {
        self.allSpells = [[NSMutableArray alloc] init];
    }
    
    return self;
}


@end
