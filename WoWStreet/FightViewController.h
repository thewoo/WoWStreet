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
#import "Spell.h"

@interface FightViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIProgressView *healthBar;



@property (nonatomic, strong) IBOutlet UILabel *firstRuneLabel;
@property (nonatomic, strong) IBOutlet UIImageView *firstRuneImageView;

@property (nonatomic, strong) IBOutlet UILabel *secondRuneLabel;
@property (nonatomic, strong) IBOutlet UIImageView *secondRuneImageView;

@property (nonatomic, strong) IBOutlet UILabel *thirdRuneLabel;
@property (nonatomic, strong) IBOutlet UIImageView *thirdRuneImageView;



@property (nonatomic, strong) IBOutlet UIView *spellView;
@property (nonatomic, strong) IBOutlet UILabel *spellLabel;

@property (nonatomic, strong) IBOutlet UIView *drawingView;
@property (nonatomic, strong) RuneDrawingUIView *runeDrawingUIView;

@property (nonatomic, strong) TargetDummy *dummy;

@property (nonatomic, strong) NSMutableArray *spellBuilder;
@property (nonatomic, strong) Spell *spell;

@end
