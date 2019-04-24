//
//  FaceIdCard.m
//  test
//
//  Created by Admin on 2018/11/21.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "FaceIdCard.h"

@interface FaceIdCard ()

@end

@implementation FaceIdCard

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"唇语验证码";
}


- (IBAction)getCode:(id)sender {
    
    NSString *urlStr = @"http://recognition.image.myqcloud.com/face/livegetfour";
    
    NSDictionary *params = @{@"appid":@"1256192072"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"recognition.image.myqcloud.com" forHTTPHeaderField:@"host"];
    [manager.requestSerializer setValue:@"FCHXdPTEwMDAwMzc5Jms9QUtJRGVRZDBrRU1yM2J4ZjhRckJi==" forHTTPHeaderField:@"authorization"];
    [manager POST:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"response : %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error :%@",error);
    }];
}


@end
