//
//  NFCViewController.m
//  test
//
//  Created by Admin on 2018/11/8.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "NFCViewController.h"
#import <CoreNFC/CoreNFC.h>

@interface NFCViewController ()<NFCNDEFReaderSessionDelegate>
{
    NFCNDEFReaderSession *nfcSession;
}
@end

@implementation NFCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    nfcSession = [[NFCNDEFReaderSession alloc]initWithDelegate:self queue:nil invalidateAfterFirstRead:YES];
    
    if (NFCNDEFReaderSession.readingAvailable) {
        NSLog(@"NFC is available");
        [nfcSession beginSession];
    }else{
        NSLog(@"NFC is not available");
    }
}

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error
{
    NSLog(@"The session was invalidated: %@",error.localizedDescription);
}


- (void)readerSession:(nonnull NFCNDEFReaderSession *)session didDetectNDEFs:(nonnull NSArray<NFCNDEFMessage *> *)messages {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"卡片信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

@end
