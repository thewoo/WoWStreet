//
//  TeachRuneUIView.h
//  WoWStreet
//
//  Created by Jorge Pardo on 22/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rune.h"

@interface TeachRuneUIView : UIView

@property int quadrantHeight;
@property int quadrantWidth;

@property (nonatomic, strong) Rune *rune;

@property (nonatomic, strong) NSMutableArray *drawingPath;
@property (nonatomic, strong) UIBezierPath *bezierPath;

@property (nonatomic, strong) NSTimer *timer;


-(void)teach;

@end
