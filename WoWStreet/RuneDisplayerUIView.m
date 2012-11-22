//
//  RuneDisplayerUIView.m
//  WoWStreet
//
//  Created by Jorge Pardo on 21/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "RuneDisplayerUIView.h"

@implementation RuneDisplayerUIView

//@synthesize rune = _rune;
@synthesize runeLabel;

#pragma mark UIView's.

//-(void)setRune:(Rune *)rune {
//    self.runeLabel.text = rune.name;
//}

-(id)initAtX:(int)x andY:(int)y {
    
    CGRect frame = CGRectMake(x, y, 97, 89);
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BlueGraySquare.png"]];
                
        self.runeLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 30, 90, 21)];
        [self.runeLabel setTextAlignment:UITextAlignmentCenter];
        [self.runeLabel setAdjustsFontSizeToFitWidth:YES];
        [self.runeLabel setTextColor:[UIColor whiteColor]];
        [self.runeLabel setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:self.runeLabel];
    }

    return self;
}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {}
    return self;
}


@end
