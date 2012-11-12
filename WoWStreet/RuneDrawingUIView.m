//
//  RuneDrawingUIView.m
//  WoWStreet
//
//  Created by Jorge Pardo on 07/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "RuneDrawingUIView.h"

@implementation RuneDrawingUIView

@synthesize quadrantHeight;
@synthesize quadrantWidth;

@synthesize bezierPath;
@synthesize drawingPathArray;


#pragma mark Touchs.

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    bezierPath = [[UIBezierPath alloc] init];
    [bezierPath setLineWidth:20];
    [bezierPath setLineCapStyle:kCGLineCapRound];
    
    UITouch *firstTouch = [[touches allObjects] objectAtIndex:0];
    
    [bezierPath moveToPoint:[firstTouch locationInView:self]];
    [drawingPathArray addObject:bezierPath];
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *drawingTouch = [[touches allObjects] objectAtIndex:0];
    
    [bezierPath addLineToPoint:[drawingTouch locationInView:self]];
    [self setNeedsDisplay];
}



#pragma mark UIView's.

- (void)drawRect:(CGRect)rect {
    
    [[UIColor blueColor] setStroke];
    
    for (UIBezierPath *path in drawingPathArray) {
        
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
        
        self.bezierPath = [[UIBezierPath alloc] init];
        self.drawingPathArray = [[NSMutableArray alloc] init];
        
        
        [self setBackgroundColor:[UIColor grayColor]];
        
        self.quadrantHeight = frame.size.height / 5;
        self.quadrantWidth = frame.size.width / 5;
        
    }
    
    return self;
}



@end
