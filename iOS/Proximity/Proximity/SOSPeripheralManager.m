//
//  SOSPeripheralManager.m
//  Proximity
//
//  Created by Sam Symons on 2014-08-18.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#import "SOSPeripheralManager.h"

static NSString * const kServiceUUID = @"312700E2-E798-4D5C-8DCF-49908332DF9F";
static NSString * const kCharacteristicUUID = @"FFA28CDE-6525-4489-801C-1C060CAC9767";

@import CoreBluetooth;

@interface SOSPeripheralManager () <CBPeripheralManagerDelegate>

@property (nonatomic, strong) CBPeripheralManager *peripheralManager;

@property (nonatomic, strong) CBMutableCharacteristic *customCharacteristic;
@property (nonatomic, strong) CBMutableService *customService;

@end

@implementation SOSPeripheralManager

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    }
    
    return self;
}

#pragma mark - Private

- (void)configureService
{
    CBUUID *characteristicUUID = [CBUUID UUIDWithString:kCharacteristicUUID];
    CBUUID *serviceUUID = [CBUUID UUIDWithString:kServiceUUID];
    
    self.customCharacteristic = [[CBMutableCharacteristic alloc] initWithType:characteristicUUID properties:CBCharacteristicPropertyNotify value:nil permissions:CBAttributePermissionsReadable];
    self.customService = [[CBMutableService alloc] initWithType:serviceUUID primary:YES];
    
    [self.customService setCharacteristics:@[self.customCharacteristic]];
    [self.peripheralManager addService:self.customService];
}

#pragma mark - CBPeripheralManagerDelegate

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    switch (peripheral.state) {
        case CBPeripheralManagerStatePoweredOn:
            [self configureService];
            break;
        default:
            NSLog(@"Peripheral manager did change state: %@", peripheral);
            break;
    }
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral didAddService:(CBService *)service error:(NSError *)error {
    if (error == nil) {
        [self.peripheralManager startAdvertising:@{ CBAdvertisementDataLocalNameKey : @"SOSServer", CBAdvertisementDataServiceUUIDsKey : @[[CBUUID UUIDWithString:kServiceUUID]] }];
    }
}

@end
