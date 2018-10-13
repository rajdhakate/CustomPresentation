//
//  ViewControllerB.m
//  CustomPresentation
//
//  Created by Raj Dhakate on 13/10/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
    [self.view addGestureRecognizer:panGesture];
}

#pragma mark - Handle Pan gesture
- (void)panGestureAction:(UIPanGestureRecognizer*)gesture {
    CGPoint translation = [gesture translationInView:self.view];
    if (translation.x != 0 || translation.y != 0) {
        double angle = atan2(fabs(translation.x), translation.y);
        if (angle < M_PI / 8) {
            [self.navigationController dismissViewControllerAnimated:true completion:nil];
        }
    }
}

@end
