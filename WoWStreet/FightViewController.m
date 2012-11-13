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

@interface FightViewController ()

@end

@implementation FightViewController

@synthesize healthBar;
@synthesize dummy;
@synthesize drawingView;
@synthesize runeDrawingUIView;

#pragma mark Actions.

-(void)updateHealhtBar {
    
    [self.healthBar setProgress:((dummy.health * 100)/dummy.maxHealth)/100 animated:YES];
}


-(void)castSpell:(UITapGestureRecognizer *)tap {
    
    NSLog(@"RuneDrawn: %@", self.runeDrawingUIView.runeDrawn);
    
    [[RunesDAO Get] recognizeRune:runeDrawingUIView.runeDrawn];
    
    
    [self.runeDrawingUIView.runeDrawn removeAllObjects];
    [self.runeDrawingUIView.drawingPathArray removeAllObjects];
    [self.runeDrawingUIView setNeedsDisplay];
    
//    self.dummy.health -= 500;
//    [self updateHealhtBar];
}



#pragma mark ViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];   
    
    [[RunesDAO Get] getAllRunes];
    
    
    dummy = [[TargetDummy alloc] init];
    
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
