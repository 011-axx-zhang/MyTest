//
//  DrivingLicense.m
//  test
//
//  Created by Admin on 2018/11/19.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "DrivingLicense.h"

@interface DrivingLicense ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *license;

@end

@implementation DrivingLicense

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"驾驶证识别";
}
- (IBAction)openAlbum:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self; // 设置代理
    picker.allowsEditing = NO;
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {//如果是拍照
        //获取照片的原图
        UIImage *original = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.license setImage:original];
//        [self imageToBase64Str];
    }
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"关闭");
}

- (IBAction)check:(id)sender {
}

@end
