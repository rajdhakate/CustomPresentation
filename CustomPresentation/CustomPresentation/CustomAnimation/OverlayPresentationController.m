//
//  OverlayPresentationController.m
//  CustomPresentation
//
//  Created by Raj Dhakate on 13/10/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

#import "OverlayPresentationController.h"

@interface OverlayPresentationController()

// Dim view
@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation OverlayPresentationController

- (void)presentationTransitionWillBegin {
    // Create Dim View
    self.dimmingView = [[UIView alloc]init];;
    self.dimmingView.frame = self.containerView.bounds;
    self.dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    
    // Set initial opacity to 0.
    self.dimmingView.alpha = 0.0;
    [self.containerView insertSubview:self.dimmingView atIndex:0];
    
    // Animate opacity to 1 while presenting view controller
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 1.0;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin {
    // Animate opacity to 0 while dismissing view controller
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0.0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.dimmingView removeFromSuperview];
    }];
}

- (CGRect)frameOfPresentedViewInContainerView {
    // Calculate presented frame
    CGSize size = self.containerView.bounds.size;
    size.height = size.height - 60;
    return CGRectMake(0, 60, size.width, size.height);
}

- (void)containerViewWillLayoutSubviews {
    // Dimming view frame always in bound with container frame
    self.dimmingView.frame = self.containerView.frame;
    
    // Presented frame
    self.presentedView.frame = [self frameOfPresentedViewInContainerView];
}

@end
