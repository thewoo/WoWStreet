//
//  TeacherUIView.m
//  WoWStreet
//
//  Created by Jorge Pardo on 22/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "TeacherUIView.h"

@implementation TeacherUIView

NSMutableArray *pathArray;
UIBezierPath *bezierPath;
NSTimer *timer;
int counter = 10;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
        
        pathArray = [[NSMutableArray alloc] init];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runeDrawer:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [[UIColor blueColor] setStroke];
    
    
    for (UIBezierPath *path in pathArray) {
        
        [path strokeWithBlendMode:kCGBlendModeNormal alpha:1];
        
    }
    
}


-(void)runeDrawer:(NSTimer *)timer {
    
    if (counter == 100) {
        
        [timer invalidate];
        timer = nil;
        
    } else {
        
        bezierPath = [[UIBezierPath alloc]init];
        
        [bezierPath moveToPoint:CGPointMake(counter-10, counter-10)];
        
        [bezierPath setLineWidth:20];
        [bezierPath setLineCapStyle:kCGLineCapRound];
        
        [bezierPath addLineToPoint:CGPointMake(counter, counter)];
        [pathArray addObject:bezierPath];
        
        counter += 10;
        
        [self setNeedsDisplay];
    }
    
    
    
    
    
    
}


@end
