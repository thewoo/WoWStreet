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

@interface FightViewController ()

@end

@implementation FightViewController

@synthesize healthBar;
@synthesize dummy;

@synthesize drawingView;
@synthesize runeDrawingUIView;

@synthesize spell;
@synthesize spellBuilder;

@synthesize firstRuneLabel;
@synthesize firstRuneImageView;

@synthesize secondRuneLabel;
@synthesize secondRuneImageView;

@synthesize thirdRuneLabel;
@synthesize thirdRuneImageView;

#pragma mark Actions.

-(void)updateHealhtBar {
    
    [self.healthBar setProgress:((dummy.health * 100)/dummy.maxHealth)/100 animated:YES];
}


-(void)castSpell:(UITapGestureRecognizer *)tap {
    
    Rune *rune = [[RunesDAO Get] recognizeRune:runeDrawingUIView.runeDrawn];
    
    if (rune) {        
        [self.spellBuilder addObject:rune];
        [self activeRune];
    }
    
    [self buildSpell];    
    [self.runeDrawingUIView reset];
    
//    self.dummy.health -= 500;
//    [self updateHealhtBar];
}


-(void)buildSpell {
    
    if ([spellBuilder count] == 3) {
        
        
        NSMutableArray *spellRunesIDsArray = [[NSMutableArray alloc] init];
        
        for (Rune *r in spellBuilder) {
            [spellRunesIDsArray addObject:r.Id];
        }
        
        
        self.spell = [[SpellsDAO Get] findSpellWithRunes:spellRunesIDsArray];
        
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
                    NSLog(@"Spell Casted Shown.");
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
        
        [self makeRuneFadeIn:firstRuneImageView andLabel:firstRuneLabel];
        rune = [spellBuilder objectAtIndex:0];
        [self.firstRuneLabel setText:rune.name];
        
    } else if (runeNumber == 2) {
        
        [self makeRuneFadeIn:secondRuneImageView andLabel:secondRuneLabel];
        rune = [spellBuilder objectAtIndex:1];
        [self.secondRuneLabel setText:rune.name];
        
    } else if (runeNumber == 3) {
        
        [self makeRuneFadeIn:thirdRuneImageView andLabel:thirdRuneLabel];
        rune = [spellBuilder objectAtIndex:2];
        [self.thirdRuneLabel setText:rune.name];
        
    }
    
    
}

-(void)makeRuneFadeIn:(UIImageView *)runeImageView andLabel:(UILabel *)runeLabel {
    
    [UIView animateWithDuration:0.5 animations:^{
        [runeImageView setAlpha:1];
        [runeLabel setAlpha:1];
    }];
    
}


-(void)resetRunes {
    
    [self.spellBuilder removeAllObjects];
    self.spell = nil;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [firstRuneImageView setAlpha:0];
        [secondRuneImageView setAlpha:0];
        [thirdRuneImageView setAlpha:0];
        
        [firstRuneLabel setAlpha:0];
        [secondRuneLabel setAlpha:0];
        [thirdRuneLabel setAlpha:0];
        
    }];
}



#pragma mark ViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];   
    
    [[RunesDAO Get] getAllRunes];
    [[SpellsDAO Get] getAllSpells];
    
    self.dummy = [[TargetDummy alloc] init];
    self.spellBuilder = [[NSMutableArray alloc] init];
    
    [self updateHealhtBar];
    
    
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
