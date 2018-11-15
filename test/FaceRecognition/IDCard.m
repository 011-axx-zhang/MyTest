//
//  IDCard.m
//  test
//
//  Created by Admin on 2018/11/15.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "IDCard.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface IDCard ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSString *baseStr;
}
@property (weak, nonatomic) IBOutlet UIButton *frontBtn;

@property (weak, nonatomic) IBOutlet UIImageView *front;
@property (weak, nonatomic) IBOutlet UIImageView *back;

@end

@implementation IDCard

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份证识别";
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
    self.frontBtn.hidden = YES;
    //从info取出此时摄像头的媒体类型
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {//如果是拍照
        //获取拍照的图像
//        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        //获取照片的原图
        UIImage *original = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.front setImage:original];
        //获取图片裁剪的图
//        UIImage* edit = [info objectForKey:UIImagePickerControllerEditedImage];
        //获取图片裁剪后，剩下的图
//        UIImage* crop = [info objectForKey:UIImagePickerControllerCropRect];
        //获取图片的url
//        NSURL* url = [info objectForKey:UIImagePickerControllerMediaURL];
        //获取图片的metadata数据信息
//        NSDictionary* metadata = [info objectForKey:UIImagePickerControllerMediaMetadata];
        //保存图像到相簿
//        UIImageWriteToSavedPhotosAlbum(image, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
        
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
    NSData *smallData = UIImageJPEGRepresentation(self.front.image, 1);
    
    baseStr = [smallData base64EncodedStringWithOptions:0];
}

- (IBAction)verifyIDCard:(id)sender {
    
    NSString *URL = [NSString stringWithFormat:@"http://www.yunmaiocr.com/srvSAASAPI"];
    NSString *pwd = @"lvvpNNldYpDstiWvaRmWByTHVzKaAD";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", nil];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"action":@"idcard",
                                 @"baseFile":baseStr,
                                 @"client":@"087b456c-b37e-4989-8f28-9179d498fd0c",
                                 @"password":[pwd MD5PwdEncryption]};
    
//    NSLog(@"开始验证:%@",parameters);
    [manager POST:URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
//        NSLog(@"验证数据:%@",responseObject);
        NSString *status = [responseObject objectForKey:@"status"];
        if ([status isEqualToString:@"OK"]) {
            NSDictionary *item = [[responseObject objectForKey:@"data"] objectForKey:@"item"];
            [self verifyResponse:item];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"验证失败:%@",error);
    }];
}


- (void)verifyResponse:(NSDictionary *)dic
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证结果" message:[dic mj_JSONString] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

@end
