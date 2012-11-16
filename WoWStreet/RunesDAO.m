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


#pragma mark Actions.

-(void)getAllRunes {
        
    char *lastRuneIdSQL = "Select distinct runeID from RunePoints";
    sqlite3_stmt *sqlStatement;
    
    NSMutableArray *runesIDs = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], lastRuneIdSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
               
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {            
            [runesIDs addObject:[NSNumber numberWithInt:(sqlite3_column_int(sqlStatement, 0))]];
        }
        
        
        for (int x=0; x < [runesIDs count]; x++) {
            
            Rune *rune = [[Rune alloc] init];
            
            const char *getAllRunesSQL = [[NSString stringWithFormat:@"Select Points.x, Points.y, Runes.name from Points, RunePoints, Runes where Points.pointsId = RunePoints.pointsID and Runes.runeId = RunePoints.runeID and RunePoints.runeId = %@ order by RunePoints.position", [runesIDs objectAtIndex:x]] UTF8String];
            
            if (sqlite3_prepare_v2([SQLiteManager getConnection], getAllRunesSQL, -1, &sqlStatement, NULL) == SQLITE_OK) {
                
                rune.Id = [runesIDs objectAtIndex:x];
                
                while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
                    
                    Points *point = [[Points alloc] init];
                    point.x = (float)sqlite3_column_int(sqlStatement, 0);
                    point.y = (float)sqlite3_column_int(sqlStatement, 1);
                    
                    if (rune.name == nil) rune.name = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(sqlStatement, 2)];
                    
                    [rune.runePoints addObject:point];
                }
                
                [self.allRunesArray addObject:rune];
                
            } else {                
                NSLog(@"[RunesDAO : getAllRunes / getAllRunesSQL] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
            }
        }
        
        
    } else {
        NSLog(@"[RunesDAO : getAllRunes / lastRuneIdSQL] - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
}



-(Rune *)recognizeRune:(NSMutableArray *)runeDrawn {
    
    Rune *rune;
    BOOL foundRune = NO;
    
    for (int x=0; x < [allRunesArray count]; x++) {
        
        rune = [allRunesArray objectAtIndex:x];        
        
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



#pragma mark Singleton's.

+(RunesDAO *)Get {
    
    if (!instance) {
        instance = [[RunesDAO alloc] init];
    }
    
    return instance;
}


#pragma mark Object's.

- (id)init {
    
    self = [super init];
    
    if (self) {
        self.allRunesArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}


@end
