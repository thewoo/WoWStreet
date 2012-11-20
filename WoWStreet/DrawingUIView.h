//
//  DrawingUIView.h
//  WoWStreet
//
//  Created by Jorge Pardo on 14/09/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingUIView : UIView

@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, strong) NSMutableArray *bufferArray;
@property (nonatomic, strong) UIBezierPath *bezierPath;

@property BOOL arriba;

@property NSMutableArray *runeDrawing;
@property NSMutableArray *spell;

@property NSString *direction;
@property NSString *previousDirection;

-(void)castSpell:(UITapGestureRecognizer *)tap;


@end
