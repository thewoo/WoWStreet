//
//  RuneDrawingUIView.h
//  WoWStreet
//
//  Created by Jorge Pardo on 07/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuneDrawingUIView : UIView

@property int quadrantHeight;
@property int quadrantWidth;

@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, strong) NSMutableArray *drawingPathArray;

@end
