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

@implementation SpellsDAO


#pragma mark Actions.

+(NSMutableArray *)getAllSpells {
    
    NSMutableArray *allSpells = [[NSMutableArray alloc] init];
    
    char *allSpellsIdsSQL = "Select distinct spellID from RuneSpells";
    sqlite3_stmt *sqlStatement;
    
    NSMutableArray *spellsIDS = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], allSpellsIdsSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
            [spellsIDS addObject:[NSNumber numberWithInt:sqlite3_column_int(sqlStatement, 0)]];
        }
        
        
        for (int x=0; x< [spellsIDS count]; x++) {
            
            Spell *spell = [[Spell alloc] init];
            
            const char *getAllSpellsSQL = [[NSString stringWithFormat:@"Select Spells.name, Spells.damage, Spells.description, Spells.icon, RuneSpells.runeId from Spells, RuneSpells where RuneSpells.spellId = Spells.spellID and RuneSpells.spellID = %@", [spellsIDS objectAtIndex:x]] UTF8String];
            
            if (sqlite3_prepare_v2([SQLiteManager getConnection], getAllSpellsSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
                
                spell.Id = [spellsIDS objectAtIndex:x];
                
                while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
                    
                    if (spell.name == nil) spell.name = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(sqlStatement, 0)];
                    if (spell.damage == nil) spell.damage = [NSNumber numberWithInt:sqlite3_column_int(sqlStatement, 1)];
                    if (spell.description == nil) spell.description = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(sqlStatement, 2)];
                    if (spell.icon == nil) spell.icon = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(sqlStatement, 3)];
                    
                    [spell.spellsRunes addObject:[NSNumber numberWithInt:sqlite3_column_int(sqlStatement, 4)]];
                }
                
                [allSpells addObject:spell];
            
            } else {
                NSLog(@"[SpellsDAO : getAllSpells] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
            }
        }
        
    } else {        
        NSLog(@"[SpellsDAO : getAllSpells(allSpellsIDS)] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
  
    return allSpells;
}

@end
