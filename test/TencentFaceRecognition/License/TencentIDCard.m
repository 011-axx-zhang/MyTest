//
//  TencentIDCard.m
//  test
//
//  Created by Admin on 2018/11/16.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "TencentIDCard.h"

@interface TencentIDCard ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSString *urlStr;
    
    __weak IBOutlet UITextField *picURL;
    __weak IBOutlet UITextField *name;
    __weak IBOutlet UITextField *idNumber;
    __weak IBOutlet UIImageView *picture;
}
@end

@implementation TencentIDCard

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份证照片核验";
    
    urlStr = @"https://recognition.image.myqcloud.com/face/idcardcompare";
}
- (IBAction)openAlbum:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // UIImagePickerController继承UINavigationController实现UINavigationDelegate和UIImagePickerControllerDelegate
    picker.delegate = self; // 设置代理
    picker.allowsEditing = NO;
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {//如果是拍照
        //获取照片的原图
        UIImage *original = [info objectForKey:UIImagePickerControllerOriginalImage];
        [picture setImage:original];
        [self imageToBase64Str];
    }
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"关闭");
}

- (void)imageToBase64Str
{
    NSData *smallData = UIImageJPEGRepresentation(picture.image, 1);
    
//    baseStr = [smallData base64EncodedStringWithOptions:0];
}



- (NSString *)getCode
{
    NSString *a = [NSString stringWithFormat:@"a=1256192072&b=&k=AKIDfFfu11tjW8czGUgVN8jBSYSPKKG7DKfp&e=[expiredTime]&t=[currentTime]&r=[rand]&f=[fileid]"];
    return a;
}


- (IBAction)checkIt:(id)sender {
    if (name.text.length < 1) {
        return;
    }
    if (idNumber.text.length < 1) {
        return;
    }
    
    NSDictionary *params = @{@"appid":@"123456",
                             @"idcard_number":idNumber.text,
                             @"idcard_name":name.text,
                             @"image":@"",
                             @"url":@"https://cdn.faceplusplus.com.cn/mc-official/scripts/demoScript/images/demo-pic641.jpg"};
    
    
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
    
    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//
//    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlStr parameters:params error:nil];
//    request.timeoutInterval = 10.f;
//
//    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        if (!error) {
//            NSLog(@"返回:%@",responseObject);
//        } else {
//            NSLog(@"返回失败:%@",error);
//        }
//    }];
//
//    [task resume];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
