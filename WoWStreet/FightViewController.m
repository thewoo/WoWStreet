//
//  FightViewController.m
//  WoWStreet
//
//  Created by Jorge Pardo on 06/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "FightViewController.h"
#import "TargetDummy.h"
#import "RuneDrawingUIView.h"
#import "RunesDAO.h"
#import "Rune.h"
#import "SpellsDAO.h"
#import "Magic.h"
#import "RuneDisplayerUIView.h"

@interface FightViewController ()

@end

@implementation FightViewController

@synthesize healthBar;
@synthesize dummy;

@synthesize drawingView;
@synthesize runeDrawingUIView;

@synthesize spell;
@synthesize spellBuilder;

@synthesize firstRuneDisplayerView;
@synthesize firstRuneButton;

@synthesize secondRuneDisplayerView;
@synthesize secondRuneButton;

@synthesize thirdRuneDisplayerView;
@synthesize thirdRuneButton;


#pragma mark IBActions.

-(IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];    
}

-(IBAction)undoFirstRune:(id)sender {
    
    if ([spellBuilder count] == 1) {
        [self makeRuneFadeOut:firstRuneDisplayerView];
        [self.spellBuilder removeLastObject];
    }    
}

-(IBAction)undoSecondRune:(id)sender {
    
    if ([spellBuilder count] == 2) {
        [self makeRuneFadeOut:secondRuneDisplayerView];
        [self.spellBuilder removeLastObject];
    }
}

-(IBAction)undoThirdRune:(id)sender {
    
    if ([spellBuilder count] == 3) {
        [self makeRuneFadeOut:thirdRuneDisplayerView];
        [self.spellBuilder removeLastObject];
    }
}



#pragma mark Actions.

-(void)updateHealhtBar {

    if (dummy.health <= 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Victoria!" message:@"Has derrotado a un muñeco, enhorabuena!" delegate:self cancelButtonTitle:@"Yay!" otherButtonTitles:nil, nil];
        
        [alert show];
        
        self.dummy = [[TargetDummy alloc] init];
    }
    
    [self.healthBar setProgress:((dummy.health * 100)/dummy.maxHealth)/100 animated:YES];
}


-(void)castSpell:(UITapGestureRecognizer *)tap {
    
    Rune *rune = [[Magic Get] recognizeRune:runeDrawingUIView.runeDrawn];
    
    if (rune) {        
        [self.spellBuilder addObject:rune];
        [self activeRune];
    }
    
    [self buildSpell];    
    [self.runeDrawingUIView reset];
}




-(void)buildSpell {
    
    if ([spellBuilder count] == 3) {
        
        NSMutableArray *spellRunesIDsArray = [[NSMutableArray alloc] init];
        
        for (Rune *r in spellBuilder) {
            [spellRunesIDsArray addObject:r.Id];
        }
        
        
        self.spell = [[Magic Get] findSpellWithRunes:spellRunesIDsArray];
        
        if (spell) {
            
            self.spellLabel.text = [NSString stringWithFormat:@"%@!", spell.name];
            self.dummy.health -= [spell.damage intValue];
            [self updateHealhtBar];
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.spellView setAlpha:1];
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationCurveLinear animations:^{
                    
                    [self resetRunes];
                    [self.spellView setAlpha:0];
                    
                } completion:^(BOOL finished) {
                }];
                
            }];
            
            [self.spellBuilder removeAllObjects];
            
        } else {
            [self resetRunes];
        }
    }
    
}


-(void)activeRune {
    
    int runeNumber = [spellBuilder count];
    Rune *rune;
    
    if (runeNumber == 1) {
        
        [self makeRuneFadeIn:firstRuneDisplayerView];
        rune = [spellBuilder objectAtIndex:0];
        self.firstRuneDisplayerView.runeLabel.text = rune.name;
        
    } else if (runeNumber == 2) {
        
        [self makeRuneFadeIn:secondRuneDisplayerView];
        rune = [spellBuilder objectAtIndex:1];
        self.secondRuneDisplayerView.runeLabel.text = rune.name;
        
    } else if (runeNumber == 3) {
        
        [self makeRuneFadeIn:thirdRuneDisplayerView];
        rune = [spellBuilder objectAtIndex:2];
        self.thirdRuneDisplayerView.runeLabel.text = rune.name;        
    }
}


-(void)makeRuneFadeIn:(RuneDisplayerUIView *)runeDisplayerView {
    
    [UIView animateWithDuration:0.5 animations:^{
        [runeDisplayerView setAlpha:1];
    }];
}

-(void)makeRuneFadeOut:(RuneDisplayerUIView *)runeDisplayerView {
    
    [UIView animateWithDuration:0.5 animations:^{
        [runeDisplayerView setAlpha:0];
    }];
}


-(void)resetRunes {
    
    [self.spellBuilder removeAllObjects];
    self.spell = nil;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.firstRuneDisplayerView setAlpha:0];
        [self.secondRuneDisplayerView setAlpha:0];
        [self.thirdRuneDisplayerView setAlpha:0];
        
    }];
}


#pragma mark ViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.dummy = [[TargetDummy alloc] init];
    self.spellBuilder = [[NSMutableArray alloc] init];
    
    [self updateHealhtBar];
    
    self.firstRuneDisplayerView = [[RuneDisplayerUIView alloc] initAtX:10 andY:22];
    [self.view addSubview:firstRuneDisplayerView];
    [self.firstRuneDisplayerView setAlpha:0];
    
    [self.view bringSubviewToFront:self.firstRuneButton];
    
    self.secondRuneDisplayerView = [[RuneDisplayerUIView alloc] initAtX:112 andY:22];
    [self.view addSubview:secondRuneDisplayerView];
    [self.secondRuneDisplayerView setAlpha:0];
    
    [self.view bringSubviewToFront:self.secondRuneButton];
    
    self.thirdRuneDisplayerView = [[RuneDisplayerUIView alloc] initAtX:213 andY:22];
    [self.view addSubview:thirdRuneDisplayerView];
    [self.thirdRuneDisplayerView setAlpha:0];
    
    [self.view bringSubviewToFront:self.thirdRuneButton];    
    [self.view bringSubviewToFront:self.spellView];
    
    self.runeDrawingUIView = [[RuneDrawingUIView alloc] initWithFrame:CGRectMake(0, 0, drawingView.frame.size.width, drawingView.frame.size.height)];
    [self.drawingView addSubview:runeDrawingUIView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(castSpell:)];
    [self.drawingView addGestureRecognizer:tap];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    return self;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
