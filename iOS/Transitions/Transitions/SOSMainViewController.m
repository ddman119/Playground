//
//  SOSMainViewController.m
//  Transitions
//
//  Created by Sam Symons on 2014-09-19.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#import "SOSMainViewController.h"

#import "SOSModalViewController.h"
#import "SOSModalTransitionController.h"

@interface SOSMainViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation SOSMainViewController

- (id)init
{
    self = [super initWithNibName:@"SOSMainViewController" bundle:nil];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.95f green:0.55f blue:0.12f alpha:1.0f];
}

- (IBAction)displayModal:(id)sender
{
    SOSModalViewController *modalViewController = [[SOSModalViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:modalViewController];
    navigationController.modalPresentationStyle = UIModalPresentationCustom;
    navigationController.transitioningDelegate = self;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    SOSModalTransitionController *controller = [[SOSModalTransitionController alloc] init];
    return controller;
}

@end
