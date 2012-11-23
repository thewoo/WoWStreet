//
//  TeachRuneUIView.m
//  WoWStreet
//
//  Created by Jorge Pardo on 22/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "TeachRuneUIView.h"
#import "Points.h"

@implementation TeachRuneUIView

@synthesize rune;

@synthesize quadrantHeight;
@synthesize quadrantWidth;

@synthesize drawingPath;
@synthesize bezierPath;

@synthesize timer;

int count = 1;

#pragma mark Actions.

-(void)teach {
    
    self.bezierPath = [[UIBezierPath alloc] init];
    self.drawingPath = [[NSMutableArray alloc] init];
    count = 1;
    [self setNeedsDisplay];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(steppedDrawing:) userInfo:nil repeats:YES];
}

-(void)steppedDrawing:(NSTimer *)timer {
        
    if (count < [rune.runePoints count]) {
        
        self.bezierPath = [[UIBezierPath alloc] init];
        
        Points *pp = [rune.runePoints objectAtIndex:count-1];
        
        [self.bezierPath moveToPoint:CGPointMake(pp.x*quadrantWidth+(quadrantWidth*0.5), pp.y*quadrantHeight+(quadrantHeight*0.5))];
        
        [self.bezierPath setLineWidth:20];
        [self.bezierPath setLineCapStyle:kCGLineCapRound];
        
        Points *p = [rune.runePoints objectAtIndex:count];
        
        [self.bezierPath addLineToPoint:CGPointMake(p.x*quadrantWidth+(quadrantWidth*0.5), p.y*quadrantHeight+(quadrantHeight*0.5))];
        [self.drawingPath addObject:bezierPath];
        
        count++;
        
        [self setNeedsDisplay];
        
    } else {
        
        [self.timer invalidate];
        self.timer = nil;
    }
    
}




#pragma mark UIView's.

- (void)drawRect:(CGRect)rect {
    
    [[UIColor greenColor] setStroke];
    
    for (UIBezierPath *path in drawingPath) {
        [path strokeWithBlendMode:kCGBlendModeNormal alpha:1];
    }
    
    
    
    UIBezierPath *verticalLine = [[UIBezierPath alloc] init];
    
    for (int x = quadrantWidth; x < self.frame.size.width; x += quadrantWidth) {
        
        [verticalLine moveToPoint:CGPointMake(x, 0)];
        [verticalLine addLineToPoint:CGPointMake(x, self.frame.size.height)];
        
    }
    
    [verticalLine setLineWidth:5];
    [[UIColor blackColor] setStroke];
    
    [verticalLine stroke];
    
    
    
    UIBezierPath *horizontalLine = [[UIBezierPath alloc] init];
    
    for (int y = quadrantHeight; y < self.frame.size.height-quadrantHeight; y += quadrantHeight) {
        
        [horizontalLine moveToPoint:CGPointMake(0, y)];
        [horizontalLine addLineToPoint:CGPointMake(self.frame.size.width, y)];
        
    }
    
    [horizontalLine setLineWidth:5];
    [[UIColor blackColor] setStroke];
    
    [horizontalLine stroke];

}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        self.quadrantHeight = frame.size.height / 5;
        self.quadrantWidth = frame.size.width / 5;
    }
    return self;
}

@end
