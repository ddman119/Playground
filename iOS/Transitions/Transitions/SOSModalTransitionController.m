//
//  SOSModalTransitionController.m
//  Transitions
//
//  Created by Sam Symons on 2014-09-19.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#import "SOSModalTransitionController.h"

CGFloat SOSModalViewWidth = 320.0;
CGFloat SOSModalViewHeight = 400.0;
CGFloat SOSModalViewVerticalOffset = 30.0;

@interface SOSModalTransitionController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation SOSModalTransitionController

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *container = [transitionContext containerView];
    
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    self.dimmingView.alpha = 0.0;
    
    [container addSubview:self.dimmingView];
    [container addSubview:to.view];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.dimmingView.frame = screenRect;
    CGFloat horizontalOffset = (CGRectGetWidth(screenRect) / 2) - (SOSModalViewWidth / 2);
    [to.view setFrame:CGRectMake(horizontalOffset, -screenRect.size.height, SOSModalViewWidth, SOSModalViewHeight)];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.dimmingView.alpha = 1.0;
        [to.view setFrame:CGRectMake(horizontalOffset, SOSModalViewVerticalOffset, SOSModalViewWidth, SOSModalViewHeight)];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (UIView *)dimmingView
{
    if (!_dimmingView) {
        _dimmingView = [[UIView alloc] init];
        _dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    }
    
    return _dimmingView;
}

@end
