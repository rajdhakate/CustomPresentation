//
//  OverlayTransitioningDelegate.m
//  CustomPresentation
//
//  Created by Raj Dhakate on 13/10/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

#import "OverlayTransitioningDelegate.h"
#import "OverlayPresentationController.h"
#import "ControllerAnimator.h"

@interface OverlayTransitioningDelegate()

@end

@implementation OverlayTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[OverlayPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    ControllerAnimator *animator = [[ControllerAnimator alloc]init];
    animator.isPresenting = true;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[ControllerAnimator alloc]init];
}

@end
