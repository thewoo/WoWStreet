//
//  MainMenuViewController.m
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "MainMenuViewController.h"
#import "FightViewController.h"
#import "SpellBookViewController.h"
#import "Magic.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize fightViewController;
@synthesize trainButton;
@synthesize spellBookButton;

#pragma mark IBActions.

-(IBAction)openTrainingSession:(id)sender {
    
    if (!fightViewController) {
        fightViewController = [[FightViewController alloc] initWithNibName:@"FightViewController" bundle:nil];
    }
    
    [self.navigationController pushViewController:fightViewController animated:YES];
}


-(void)openSpellBook:(id)sender {
    
    SpellBookViewController *spellBookViewController = [[SpellBookViewController alloc] initWithNibName:@"SpellBookViewController" bundle:nil];
    [self.navigationController pushViewController:spellBookViewController animated:YES];
}



#pragma mark UIViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[Magic Get] getAllRunes];
    [[Magic Get] getAllSpells];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
