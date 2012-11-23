//
//  SpellBookViewController.h
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RuneDisplayerUIView.h"
#import "TeachRuneUIView.h"

@interface SpellBookViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *spellsTableView;

@property (nonatomic, strong) IBOutlet UITextView *descriptionTextView;

@property (nonatomic, strong) RuneDisplayerUIView *firstRuneDisplayerView;
@property (nonatomic, strong) IBOutlet UIButton *firstRuneTeacherButton;

@property (nonatomic, strong) RuneDisplayerUIView *secondRuneDisplayerView;
@property (nonatomic, strong) IBOutlet UIButton *secondRuneTeacherButton;

@property (nonatomic, strong) RuneDisplayerUIView *thirdRuneDisplayerView;
@property (nonatomic, strong) IBOutlet UIButton *thirdRuneTeacherButton;

@property (nonatomic, strong) IBOutlet UIView *modalView;
@property (nonatomic, strong) IBOutlet UIButton *closeButton;
@property (nonatomic, strong) IBOutlet UIView *teachingView;

@property (nonatomic, strong) TeachRuneUIView *teachRuneView;

-(IBAction)teachFirstRune:(id)sender;
-(IBAction)teachSecondRune:(id)sender;
-(IBAction)teachThirdRune:(id)sender;

-(IBAction)closeModalView:(id)sender;


@end
