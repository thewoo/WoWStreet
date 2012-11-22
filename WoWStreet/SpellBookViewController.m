//
//  SpellBookViewController.m
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "SpellBookViewController.h"
#import "Magic.h"
#import "Spell.h"
#import "RuneDisplayerUIView.h"

@interface SpellBookViewController ()

@end

@implementation SpellBookViewController

@synthesize spellsTableView;
@synthesize descriptionTextView;

@synthesize firstRuneDisplayerView;
@synthesize secondRuneDisplayerView;
@synthesize thirdRuneDisplayerView;

@synthesize modalView;
@synthesize closeButton;
@synthesize teachingView;
@synthesize teachRuneView;


#pragma mark IBActions.

-(IBAction)teachFirstRune:(id)sender {
    
    NSLog(@"teachFirstRune: %@", self.firstRuneDisplayerView.rune);
    
    if (firstRuneDisplayerView.rune != nil) {
        [self.modalView setHidden:NO];
        self.teachRuneView.rune = firstRuneDisplayerView.rune;
        [teachRuneView teach];
    }
}

-(IBAction)teachSecondRune:(id)sender {
    
    NSLog(@"teachSecondRune: %@", secondRuneDisplayerView.rune);
    
    if (secondRuneDisplayerView.rune != nil) {
        [self.modalView setHidden:NO];
        self.teachRuneView.rune = secondRuneDisplayerView.rune;
        [teachRuneView teach];
    }
}

-(IBAction)teachThirdRune:(id)sender {
    
    NSLog(@"teachThirdRune: %@", thirdRuneDisplayerView.rune);
    
    if (thirdRuneDisplayerView.rune != nil) {
        [self.modalView setHidden:NO];
        self.teachRuneView.rune = thirdRuneDisplayerView.rune;
        [teachRuneView teach];        
    }
}


-(IBAction)closeModalView:(id)sender {
    
    [self.modalView setHidden:YES];
}



#pragma mark Actions.

-(void)swipeNavigation:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark UITableView's Delegate & DataSource.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[Magic Get] allSpells] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        Spell *spell = [[[Magic Get] allSpells] objectAtIndex:[indexPath row]];
        
        cell.textLabel.text = spell.name;
        cell.imageView.image = [UIImage imageNamed:spell.icon];
        
        UIView *background = [[UIView alloc] initWithFrame:[cell bounds]];
        background.backgroundColor = [UIColor whiteColor];
        
        [cell setBackgroundView:background];
        
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Spell *spell = [[[Magic Get] allSpells] objectAtIndex:[indexPath row]];
    
    self.firstRuneDisplayerView.rune = [[Magic Get] findRuneWithID:[spell.spellsRunes objectAtIndex:0]];
    self.secondRuneDisplayerView.rune = [[Magic Get] findRuneWithID:[spell.spellsRunes objectAtIndex:1]];
    self.thirdRuneDisplayerView.rune = [[Magic Get] findRuneWithID:[spell.spellsRunes objectAtIndex:2]];
    
    self.descriptionTextView.text = spell.description;
    [self.descriptionTextView setHidden:NO];
    
}

#pragma mark UIViewController's.

- (void)viewDidLoad {

    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeNavigation:)];
    [self.view addGestureRecognizer:swipe];
    
    
    self.firstRuneDisplayerView = [[RuneDisplayerUIView alloc] initAtX:10 andY:350];
    [self.view addSubview:firstRuneDisplayerView];

    [self.view bringSubviewToFront:self.firstRuneTeacherButton];

    
    self.secondRuneDisplayerView = [[RuneDisplayerUIView alloc] initAtX:112 andY:350];
    [self.view addSubview:secondRuneDisplayerView];
    
    self.thirdRuneDisplayerView = [[RuneDisplayerUIView alloc] initAtX:213 andY:350];
    [self.view addSubview:thirdRuneDisplayerView];
    
    [self.view bringSubviewToFront:self.modalView];
    
    self.teachRuneView = [[TeachRuneUIView alloc] initWithFrame:CGRectMake(0, 0, teachingView.frame.size.width, teachingView.frame.size.height)];
    [self.teachingView addSubview:teachRuneView];
    
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
