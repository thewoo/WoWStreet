//
//  RunesDAO.m
//  WoWStreet
//
//  Created by Jorge Pardo on 09/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "RunesDAO.h"
#import "SQLiteManager.h"
#import "Rune.h"
#import "Points.h"

static RunesDAO *instance = nil;

@implementation RunesDAO

@synthesize allRunesArray;


-(void)getAllRunes {
    
    self.allRunesArray = [[NSMutableArray alloc] init];
    
    char *lastRuneIdSQL = "Select max(runeId) from RunePoints";
    sqlite3_stmt *sqlStatement;
    
    int lastRuneId = 0;
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], lastRuneIdSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
               
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {            
            lastRuneId = sqlite3_column_int(sqlStatement, 0);
//            NSLog(@"LastRuneID: %d", lastRuneId);
        }
    
    } else {
        
        NSLog(@"[RunesDAO : getAllRunes / lastRuneIdSQL] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    
    for (int x=1; x <= lastRuneId; x++) {
        
        Rune *rune = [[Rune alloc] init];
        
        const char *getAllRunesSQL = [[NSString stringWithFormat:@"Select Points.x, Points.y from Points, RunePoints where Points.pointsId = RunePoints.pointsID and RunePoints.runeId = %d order by RunePoints.position", x] UTF8String];
        
        if (sqlite3_prepare_v2([SQLiteManager getConnection], getAllRunesSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
            
            rune.runeId = [NSNumber numberWithInt:x];
            
            while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
                
                Points *point = [[Points alloc] init];
                point.x = (float)sqlite3_column_int(sqlStatement, 0);
                point.y = (float)sqlite3_column_int(sqlStatement, 1);
                
                [rune.runePoints addObject:point];
            }
            
            [self.allRunesArray addObject:rune];
            
        } else {
            
            NSLog(@"[RunesDAO : getAllRunes / getAllRunesSQL] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
        }
    }    
    
}


-(void)recognizeRune:(NSMutableArray *)runeDrawn {
    
    Rune *rune;
    BOOL foundRune = NO;
    
    for (int x=0; x < [allRunesArray count]; x++) {
        
        rune = [allRunesArray objectAtIndex:x];        
        
        if ([rune.runePoints count] == [runeDrawn count]) {
            
            for (int y=0; y < [rune.runePoints count]; y++) {
                foundRune = [Points comparePoint:[rune.runePoints objectAtIndex:y] andPoint:[runeDrawn objectAtIndex:y]];
            }
        }
        
        if (foundRune) break;
    }
    
    if (foundRune) NSLog(@"Drawn Rune with ID: %@", rune.runeId);
}



+(RunesDAO *)Get {
    
    if (!instance) {
        instance = [[RunesDAO alloc] init];
    }
    
    return instance;
}


@end
