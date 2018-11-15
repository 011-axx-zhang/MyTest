//
//  FaceController.m
//  test
//
//  Created by Admin on 2018/11/15.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "FaceController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface FaceController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSString *baseStr1;
    NSString *baseStr2;
    BOOL    isFace1;
}

@property (weak, nonatomic) IBOutlet UIImageView *face1;
@property (weak, nonatomic) IBOutlet UIImageView *face2;
@property (weak, nonatomic) IBOutlet UIButton *check;

@end

@implementation FaceController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        isFace1 = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"人脸比对";
}

- (IBAction)openAlbum2:(id)sender {
    isFace1 = NO;
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self; // 设置代理
    picker.allowsEditing = NO;
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}
- (IBAction)openAlbum1:(id)sender {
    isFace1 = YES;
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self; // 设置代理
    picker.allowsEditing = NO;
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //从info取出此时摄像头的媒体类型
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        //获取照片的原图
        UIImage *original = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (isFace1) {
            [self.face1 setImage:original];
        }else{
            [self.face2 setImage:original];
        }
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
    UIImage *image;
    if (isFace1) {
        image = self.face1.image;
    }else{
        image = self.face2.image;
    }
    NSData *smallData = UIImageJPEGRepresentation(image, 1);
    
    if (isFace1) {
        baseStr1 = [smallData base64EncodedStringWithOptions:0];
    }else{
        baseStr2 = [smallData base64EncodedStringWithOptions:0];
    }
}

- (IBAction)checkFace:(id)sender {
    
    
    NSString *URL = [NSString stringWithFormat:@"http://www.yunmaiocr.com/srvSAASAPI"];
    NSString *pwd = @"lvvpNNldYpDstiWvaRmWByTHVzKaAD";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", nil];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"action":@"compareFace",
                                 @"client":@"087b456c-b37e-4989-8f28-9179d498fd0c",
                                 @"password":[pwd MD5PwdEncryption],
                                 @"photo":baseStr1,
                                 @"photo1":baseStr2};
    
    //    NSLog(@"开始验证:%@",parameters);
    [manager POST:URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                NSLog(@"验证数据:%@",responseObject);
        NSString *status = [responseObject objectForKey:@"status"];
        if ([status isEqualToString:@"OK"]) {
            NSString *item = [responseObject objectForKey:@"data"];
            [self verifyResponse:item];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"验证失败:%@",error);
    }];
}

- (void)verifyResponse:(NSString *)dic
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证结果" message:[NSString stringWithFormat:@"相似度:%@",dic] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

@end
