//
//  ControllerAnimator.m
//  CustomPresentation
//
//  Created by Raj Dhakate on 13/10/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

#import "ControllerAnimator.h"

@interface ControllerAnimator()

@end

@implementation ControllerAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Get views from Presenting and Presented View Controllers
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView  = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    // Get center of Presenetd View Controller
    CGPoint center = toView.center;
    
    if (_isPresenting) {
        CGPoint toViewCenter = center;
        toViewCenter.y = toView.bounds.size.height;
        toView.center = toViewCenter;
        [transitionContext.containerView addSubview:toView];
    } else {
        center.y = toView.bounds.size.height + fromView.bounds.size.height;
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:300 initialSpringVelocity:10 options:UIViewAnimationOptionTransitionNone animations:^{
        
        if (self.isPresenting) {
            toView.center = center;
            fromView.transform = CGAffineTransformScale(fromView.transform, 0.93, 0.93);
            fromView.layer.cornerRadius = 10;
            toView.layer.cornerRadius = 10;
        } else {
            fromView.center = center;
            toView.transform = CGAffineTransformIdentity;
            toView.layer.cornerRadius = 0;
        }
        
    } completion:^(BOOL finished) {
        if (!self.isPresenting) {
            [fromView removeFromSuperview];
        }
        
        [transitionContext completeTransition:true];
    }];
}

@end
