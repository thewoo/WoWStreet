//
//  RunesDAO.h
//  WoWStreet
//
//  Created by Jorge Pardo on 09/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rune.h"

@interface RunesDAO : NSObject


@property (nonatomic, strong) NSMutableArray *allRunesArray;

-(void)getAllRunes;
-(void)recognizeRune:(NSMutableArray *)runeDrawn;

+(RunesDAO *)Get;




@end
