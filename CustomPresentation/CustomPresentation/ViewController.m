//
//  ViewController.m
//  CustomPresentation
//
//  Created by Raj Dhakate on 13/10/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

#import "ViewController.h"
#import "OverlayTransitioningDelegate.h"
#import "ViewControllerB.h"

@interface ViewController ()

@property (nonatomic, strong) OverlayTransitioningDelegate* delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)presentAction:(UIButton *)sender {
    ViewControllerB *controller = [[ViewControllerB alloc]init];
    [self prepareOverlay:controller];
    [self presentViewController:controller animated:true completion:nil];
}

- (void)prepareOverlay:(UIViewController*)viewController {
    self.delegate = [[OverlayTransitioningDelegate alloc]init];
    viewController.transitioningDelegate = self.delegate;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
}

@end
