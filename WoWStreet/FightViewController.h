//
//  FightViewController.h
//  WoWStreet
//
//  Created by Jorge Pardo on 06/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetDummy.h"
#import "RuneDrawingUIView.h"
#import "RuneDisplayerUIView.h"
#import "Spell.h"

@interface FightViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIProgressView *healthBar;

@property (nonatomic, strong) IBOutlet UIButton *backButton;

@property (nonatomic, strong) RuneDisplayerUIView *firstRuneDisplayerView;
@property (nonatomic, strong) RuneDisplayerUIView *secondRuneDisplayerView;
@property (nonatomic, strong) RuneDisplayerUIView *thirdRuneDisplayerView;


@property (nonatomic, strong) IBOutlet UIView *spellView;
@property (nonatomic, strong) IBOutlet UILabel *spellLabel;

@property (nonatomic, strong) IBOutlet UIView *drawingView;
@property (nonatomic, strong) RuneDrawingUIView *runeDrawingUIView;

@property (nonatomic, strong) TargetDummy *dummy;

@property (nonatomic, strong) NSMutableArray *spellBuilder;
@property (nonatomic, strong) Spell *spell;


-(IBAction)back:(id)sender;

@end
