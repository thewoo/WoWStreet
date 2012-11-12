//
//  FightViewController.h
//  WoWStreet
//
//  Created by Jorge Pardo on 06/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetDummy.h"

@interface FightViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIProgressView *healthBar;

@property (nonatomic, strong) IBOutlet UIImageView *firstRuneImageView;
@property (nonatomic, strong) IBOutlet UIImageView *secondRuneImageView;
@property (nonatomic, strong) IBOutlet UIImageView *thirdRuneImageView;

@property (nonatomic, strong) IBOutlet UIView *drawingView;


@property (nonatomic, strong) TargetDummy *dummy;

@end
