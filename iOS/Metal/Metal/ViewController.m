//
//  ViewController.m
//  Metal
//
//  Created by Sam Symons on 2014-11-28.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#import "ViewController.h"

#import "MetalView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MetalView *metalView = [[MetalView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:metalView];
}

@end
