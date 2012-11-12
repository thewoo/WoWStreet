//
//  ViewController.h
//  WoWStreet
//
//  Created by Jorge Pardo on 14/09/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingUIView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *drawingView;
@property (nonatomic, strong) IBOutlet DrawingUIView *drawingUIView;

@property (nonatomic, strong) NSArray *spell;
@property (nonatomic, strong) NSMutableArray *spellsArray;

@end
