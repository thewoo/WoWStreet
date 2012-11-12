//
//  DrawingUIView.m
//  WoWStreet
//
//  Created by Jorge Pardo on 14/09/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "DrawingUIView.h"

@implementation DrawingUIView

@synthesize pathArray;
@synthesize bufferArray;
@synthesize bezierPath;

@synthesize runeDrawing;
@synthesize spell;

@synthesize direction;
@synthesize previousDirection;

float cuadranteX = 0.0;
float cuadranteY = 0.0;

int anchoCuadrante = 64;
int altoCuadrante = 92;

#pragma mark Actions.

-(void)castSpell:(UITapGestureRecognizer *)tap {
    
    NSLog(@"Top, top, top");
    
}



#pragma mark UIVIew's.

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        pathArray = [[NSMutableArray alloc] init];
        bufferArray = [[NSMutableArray alloc] init];
        
        runeDrawing = [[NSMutableArray alloc] init];
        
//        spell = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(0, 1)], [NSValue valueWithCGPoint:CGPointMake(1, 1)], [NSValue valueWithCGPoint:CGPointMake(2, 1)], [NSValue valueWithCGPoint:CGPointMake(3, 1)], [NSValue valueWithCGPoint:CGPointMake(4, 1)], nil];
        
        spell = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(2,1)],                
                                                        [NSValue valueWithCGPoint:CGPointMake(3,1)],
                                                        [NSValue valueWithCGPoint:CGPointMake(3,2)],
                                                        [NSValue valueWithCGPoint:CGPointMake(2,2)],
                                                        [NSValue valueWithCGPoint:CGPointMake(1,2)],
                                                        [NSValue valueWithCGPoint:CGPointMake(1,1)],                 
                                                        nil];
        
        [self setBackgroundColor:[UIColor grayColor]];
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect {
    
    [[UIColor blueColor] setStroke];
    
    for (UIBezierPath *path in pathArray) {
        
        [path strokeWithBlendMode:kCGBlendModeNormal alpha:1];
    }
    
    
    
    UIBezierPath *verticalLine = [[UIBezierPath alloc] init];
    
    for (int x=anchoCuadrante; x<320; x+=anchoCuadrante) {
        
        [verticalLine moveToPoint:CGPointMake(x, 0)];
        [verticalLine addLineToPoint:CGPointMake(x, 460)];
    }
    
    [verticalLine setLineWidth:5];
    [[UIColor blackColor] setStroke];
    
    [verticalLine stroke];
    
    UIBezierPath *horizontalLine = [[UIBezierPath alloc] init];
    
    for (int y=altoCuadrante; y<460; y+=altoCuadrante) {
        
        [horizontalLine moveToPoint:CGPointMake(0, y)];
        [horizontalLine addLineToPoint:CGPointMake(320, y)];
    }
    
    [horizontalLine setLineWidth:5];
    [[UIColor blackColor] setStroke];
    
    [horizontalLine stroke];
    
}



#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    bezierPath = [[UIBezierPath alloc]init];
    [bezierPath setLineWidth:20];
    [bezierPath setLineCapStyle:kCGLineCapRound];
    
    
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    
    [bezierPath moveToPoint:[mytouch locationInView:self]];
    [pathArray addObject:bezierPath];
    
//    [runeDrawing removeAllObjects];
    
}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint points = [[touches anyObject] locationInView:self];
    
    if (cuadranteX != floor(points.x/anchoCuadrante) || cuadranteY != floor(points.y/altoCuadrante)) {
        
        cuadranteX = floor(points.x/anchoCuadrante);
        cuadranteY = floor(points.y/altoCuadrante);
        
        [runeDrawing addObject:[NSValue valueWithCGPoint:CGPointMake(floor(points.x/anchoCuadrante), floor(points.y/altoCuadrante))]];
        
    NSLog(@"Es el Cuadrante: %d, %d", (int)cuadranteX, (int)cuadranteY);
        
    }
    
   /*
    
    
    int count = 6;
    BOOL success = NO;
    int successCount = 0;
    
//    if ([runeDrawing count] > [spell count]) {
//        count = [spell count];
//        
//    } else {
//        count = [runeDrawing count];
//    }
        
    if ([runeDrawing count] == 6) {
    
    for (int x=0; x < count; x++) {
        
        CGPoint rPoint = [[runeDrawing objectAtIndex:x] CGPointValue];        
        CGPoint sPoint = [[spell objectAtIndex:x] CGPointValue];
        
        if (CGPointEqualToPoint(sPoint, rPoint)) {
            successCount ++;
        }
        
        
        if (successCount == count) {
            success = YES;
        }
        
    }
    
    if (success) {
        NSLog(@"Fiush!");
    }
    
//    [runeDrawing removeAllObjects];
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Direcciones.
    
    UITouch *touch = [touches anyObject];
    
    CGPoint actual = [touch locationInView:self];
    CGPoint previous = [touch previousLocationInView:self];
    
    
    if (abs(actual.x - previous.x) > abs(actual.y-previous.y)) {
        
        if  (actual.x > previous.x) {
            self.direction = @"Derecha";
            
        } else {
            self.direction = @"Izquierda";
            
        }
        
    } else {
        
        if (actual.y > previous.y) {
            self.direction = @"Abajo";
            
        } else {
            self.direction = @"Arriba";
        }
        
    }
    
    
    if (![previousDirection isEqualToString:direction]) {
        
        self.previousDirection = direction;
        
        //        NSLog(@"%@", direction);
        
    }
    
    
*/
    
    //Dibuja.
    
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    
    [bezierPath addLineToPoint:[myTouch locationInView:self]];
    [self setNeedsDisplay];
    
    
    
}

@end
