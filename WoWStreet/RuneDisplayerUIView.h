//
//  RuneDisplayerUIView.h
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rune.h"

@interface RuneDisplayerUIView : UIView

@property (nonatomic, strong) Rune *rune;
@property (nonatomic, strong) UILabel *runeLabel;

-(id)initAtX:(int)x andY:(int)y;

@end
