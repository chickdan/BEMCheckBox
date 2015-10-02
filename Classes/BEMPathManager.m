//
//  BEMPathManager.m
//  CheckBox
//
//  Created by Bobo on 9/19/15.
//  Copyright (c) 2015 Boris Emorine. All rights reserved.
//

#import "BEMPathManager.h"

@implementation BEMPathManager

#pragma mark Paths

- (UIBezierPath *)pathForBox {
    UIBezierPath* path;
    switch (self.boxType) {
        case BEMBoxTypeSquare:
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size, self.size) cornerRadius:3.0];
            break;
            
        default:
            path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.lineWidth, self.lineWidth, self.size - self.lineWidth*2, self.size - self.lineWidth*2)];
            break;
    }
    return path;
}

- (UIBezierPath *)pathForCheckMark {
    UIBezierPath* checkMarkPath = [UIBezierPath bezierPath];
    
    [checkMarkPath moveToPoint: CGPointMake(self.size/3.1578, self.size/2)];
    [checkMarkPath addLineToPoint: CGPointMake(self.size/2.0618, self.size/1.57894)];
    [checkMarkPath addLineToPoint: CGPointMake(self.size/1.3953, self.size/2.7272)];
    
    if (self.boxType == BEMBoxTypeSquare) {
        // If we use a square box, the check mark should be a little bit bigger
        [checkMarkPath applyTransform:CGAffineTransformMakeScale(1.5, 1.5)];
        [checkMarkPath applyTransform:CGAffineTransformMakeTranslation(-self.size/4, -self.size/4)];
    }
    
    return checkMarkPath;
}

- (UIBezierPath *)pathForFlatCheckMark {
    UIBezierPath* flatCheckMarkPath = [UIBezierPath bezierPath];
    [flatCheckMarkPath moveToPoint: CGPointMake(self.size/4, self.size/2)];
    [flatCheckMarkPath addLineToPoint: CGPointMake(self.size/2, self.size/2)];
    [flatCheckMarkPath addLineToPoint: CGPointMake(self.size/1.2, self.size/2)];
    
    return flatCheckMarkPath;
}

@end