//
//  SOSPeripheralViewController.m
//  Proximity
//
//  Created by Sam Symons on 2014-08-18.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#import "SOSPeripheralViewController.h"

#import "SOSPeripheralManager.h"

@interface SOSPeripheralViewController ()

@property (nonatomic, strong) SOSPeripheralManager *peripheralManager;
@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation SOSPeripheralViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _peripheralManager = [[SOSPeripheralManager alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.statusLabel = [[UILabel alloc] init];
    self.statusLabel.text = @"Configuring...";
    
    [self.view addSubview:self.statusLabel];
}

@end
