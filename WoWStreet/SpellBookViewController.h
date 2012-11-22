//
//  SpellBookViewController.h
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RuneDisplayerUIView.h"

@interface SpellBookViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *spellsTableView;

@property (nonatomic, strong) IBOutlet UITextView *descriptionTextView;

@property (nonatomic, strong) RuneDisplayerUIView *firstRuneDisplayerView;
@property (nonatomic, strong) RuneDisplayerUIView *secondRuneDisplayerView;
@property (nonatomic, strong) RuneDisplayerUIView *thirdRuneDisplayerView;

@end
