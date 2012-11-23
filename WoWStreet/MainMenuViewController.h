//
//  MainMenuViewController.h
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FightViewController.h"

@interface MainMenuViewController : UIViewController

@property (nonatomic, strong) FightViewController *fightViewController;

@property (nonatomic, strong) IBOutlet UIButton *trainButton;
@property (nonatomic, strong) IBOutlet UIButton *spellBookButton;

-(IBAction)openTrainingSession:(id)sender;
-(IBAction)openSpellBook:(id)sender;

@end
