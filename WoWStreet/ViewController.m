//
//  ViewController.m
//  WoWStreet
//
//  Created by Jorge Pardo on 14/09/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize drawingView;
@synthesize spell;
@synthesize drawingUIView;
@synthesize spellsArray;

#pragma mark Actions.

-(void)castSpell:(UITapGestureRecognizer *)tap {
    
    NSLog(@"El Hechizo dibujado: %@", self.drawingUIView.runeDrawing);
    
    int counter = 0;
    
    
    if ([self.drawingUIView.runeDrawing count] > 0) {
      
        for (int y=0; y < [self.spellsArray count]; y++) {
            
            
            NSLog(@"Compruebo el hechizo número %d", y);
            
            if ([self.drawingUIView.runeDrawing count] > [[spellsArray objectAtIndex:y] count]) {
                counter = [[spellsArray objectAtIndex:y] count];
                
            } else {
                counter = [self.drawingUIView.runeDrawing count];
            }
            
            int successCount = 0;
            
            for (int x=0; x < counter; x++) {
                
                CGPoint rPoint = [[self.drawingUIView.runeDrawing objectAtIndex:x] CGPointValue];
                CGPoint sPoint = [[[spellsArray objectAtIndex:y] objectAtIndex:x] CGPointValue];
                
                if (CGPointEqualToPoint(rPoint, sPoint)) {
                    successCount++;
                    NSLog(@"SuccessCounter: %d", successCount);
                }
            }
            
            if (successCount == [[spellsArray objectAtIndex:y] count] && [[spellsArray objectAtIndex:y] count] == [self.drawingUIView.runeDrawing count]) {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Spell Casted!" message:[NSString stringWithFormat:@"You've casted the %dº spell", y] delegate:self cancelButtonTitle:@"Shazam!" otherButtonTitles:nil, nil];
                
                [alert show];
                break;
            }
            
        }
        
    }
    
    [self.drawingUIView.runeDrawing removeAllObjects];
    [self.drawingUIView.pathArray removeAllObjects];
    [self.drawingUIView setNeedsDisplay];
    
}


#pragma mark Life Cylce (Embanana, embanananaaaa).

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.drawingUIView = [[DrawingUIView alloc] initWithFrame:self.drawingView.frame];
    
    [self.drawingView addSubview:drawingUIView];
    
    self.spellsArray = [[NSMutableArray alloc] init];
    
    spell = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(1, 0)], [NSValue valueWithCGPoint:CGPointMake(2, 0)], [NSValue valueWithCGPoint:CGPointMake(3, 0)], [NSValue valueWithCGPoint:CGPointMake(4, 0)], nil];
    
    [spellsArray addObject:spell];

    self.spell = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(2,1)],
             [NSValue valueWithCGPoint:CGPointMake(3,1)],
             [NSValue valueWithCGPoint:CGPointMake(3,2)],
             [NSValue valueWithCGPoint:CGPointMake(2,2)],
             [NSValue valueWithCGPoint:CGPointMake(1,2)],
             [NSValue valueWithCGPoint:CGPointMake(1,1)],
             nil];
    
    [spellsArray addObject:spell];
    
    self.spell = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(1,1)],
                  [NSValue valueWithCGPoint:CGPointMake(2,1)],
                  [NSValue valueWithCGPoint:CGPointMake(3,1)],
                  [NSValue valueWithCGPoint:CGPointMake(2,2)],
                  [NSValue valueWithCGPoint:CGPointMake(3,2)],
                  [NSValue valueWithCGPoint:CGPointMake(3,3)],
                  [NSValue valueWithCGPoint:CGPointMake(2,3)],
                  [NSValue valueWithCGPoint:CGPointMake(1,3)],
                  [NSValue valueWithCGPoint:CGPointMake(1,2)],
                  nil];
    
    [spellsArray addObject:spell];
    
    self.spell = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(1,1)],
                  [NSValue valueWithCGPoint:CGPointMake(2,1)],
                  [NSValue valueWithCGPoint:CGPointMake(3,1)],
                  [NSValue valueWithCGPoint:CGPointMake(3,2)],
                  [NSValue valueWithCGPoint:CGPointMake(3,3)],
                  [NSValue valueWithCGPoint:CGPointMake(2,3)],
                  [NSValue valueWithCGPoint:CGPointMake(1,3)],
                  [NSValue valueWithCGPoint:CGPointMake(1,2)],
                  nil];
    
    [spellsArray addObject:spell];

    
    NSLog(@"SpellsArray: %@", spellsArray);
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(castSpell:)];
    [self.drawingView addGestureRecognizer:tapGesture];
    
}



- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
