//
//  AppDelegate.m
//  test
//
//  Created by Admin on 2018/8/27.
//  Copyright © 2018年 Tima. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <ImSDK/ImSDK.h>
#import <TUIKit/TUIKit.h>

#import "ConstHeader.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [AMapServices sharedServices].apiKey = AMapSDKAPPKey;
    
    /*
    NSInteger sdkAppid = 1400102901; //填入自己app的sdkAppid
    TUIKitConfig *config = [TUIKitConfig defaultConfig];//默认TUIKit配置，这个您可以根据自己的需求在 TUIKitConfig 里面自行配置
    [[TUIKit sharedInstance] initKit:sdkAppid withConfig:config];
    NSString *identifier = @"abc"; //填入登录用户名
    NSString *userSig = @"eJxlz0FPgzAUwPE7n4JwNtIWu1ETD4gENcgSRjN3IoyWrWNQwjoQjN-diBqb*K6--8vLezdM07TSaH2dF4W8NCpTY8st89a0gHX1h20rWJarzOnYP*Rvreh4lpeKdzNCjDECQG8E440Spfgp8l2h4ZlV2Xzhe-sGAAgQAVBPxH7Gl4D6T2HqrFL6YHfhM1O0X18eF9F9SeWQusNY4eqwJ4lkkTrZr54IPBEutlsaB0PjJ4G-CTbHlXtKJJ*WyovJrid2fZymQz3G9E47qUTNf99BiLgQLTXteXcWspkDBCCGyAFfYxkfxidZ7F0H"; //填入签名userSig
    [[TUIKit sharedInstance] loginKit:identifier userSig:userSig succ:^{
        NSLog(@"登陆成功");
        //登录成功
    } fail:^(int code, NSString *msg) {
        //登录失败
        NSLog(@"登陆失败code:%d   msg:%@",code,msg);
    }];*/
    
    //  增加了弹出框
    
//    MainViewController *rootVC = [[MainViewController alloc]init];
    
//    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    
//    self.window.rootViewController = rootNav;
    
//    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
