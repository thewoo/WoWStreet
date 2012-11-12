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

@interface FightViewController ()

@end

@implementation FightViewController

@synthesize healthBar;
@synthesize dummy;
@synthesize drawingView;

#pragma mark Actions.

-(void)updateHealhtBar {
    
    [self.healthBar setProgress:((dummy.health * 100)/dummy.maxHealth)/100 animated:YES];
}


-(void)castSpell:(UITapGestureRecognizer *)tap {
    
    self.dummy.health -= 500;
    [self updateHealhtBar];
}



#pragma mark ViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *points = @"";
    
    for (int x=0; x<=5; x++) {
        
        for (int y=0; y<=5; y++) {
            
            points = [NSString stringWithFormat:@"%@\nInsert into Points values (NULL, %d, %d);", points, x, y];
        }
    }
    
    NSLog(@"%@", points);
    
    
    
    
    dummy = [[TargetDummy alloc] init];
    
    [self updateHealhtBar];
    
    [self.drawingView addSubview:[[RuneDrawingUIView alloc] initWithFrame:CGRectMake(0, 0, drawingView.frame.size.width, drawingView.frame.size.height)]];
    
    
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
