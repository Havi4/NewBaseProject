//
//  AppDelegate.m
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CYLTabBarControllerConfig.h"
#import "TabPlusButtonSubclass.h"
#import "IanAdsStartView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [TabPlusButtonSubclass registerPlusButton];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setUpNavigationBarAppearance];
    #pragma mark 设置tabbar
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    self.window.rootViewController = tabBarControllerConfig.tabBarController;
    [self.window makeKeyAndVisible];
   
#pragma mark 进行广告位
    [self initAllRequestParams];
    [self setAdvertisement];
    
    return YES;
}

- (void)initAllRequestParams
{
    //设置baseUrl
    [HYBNetworking updateBaseUrl:kAppBaseURL];
    //请求取消时间
    [HYBNetworking setTimeout:30];
    //设置没有网络的时候从本地读取数据
    [HYBNetworking obtainDataFromLocalWhenNetworkUnconnected:YES];
    //缓存get请求，
    [HYBNetworking cacheGetRequest:YES shoulCachePost:NO];
    //debug模式。放心使用，使用debug
    [HYBNetworking enableInterfaceDebug:YES];
    //配置请求和接受格式，json
    [HYBNetworking configRequestType:kHYBRequestTypeJSON responseType:kHYBResponseTypeJSON shouldAutoEncodeUrl:NO callbackOnCancelRequest:YES];
    //配置请求头
    [HYBNetworking configCommonHttpHeaders:@{
                                             @"AccessToken" : kAccessTocken,
                                             @"Accept":@"application/json"
                                             }];
}

#pragma mark 设置广告

- (void)setAdvertisement
{
    NSString *picUrl = @"http://785j3g.com1.z0.glb.clouddn.com/d659db60-f.jpg";
    NSString *userDefaultKey = @"download_key";
    if ([kUserDefaults stringForKey:kAdvertismentTag].length > 0) {
        picUrl = [kUserDefaults stringForKey:kAdvertismentTag];
    }
    if ([[kUserDefaults stringForKey:userDefaultKey] isEqualToString:@"1"]) {
        IanAdsStartView *startView = [IanAdsStartView startAdsViewWithBgImageUrl:picUrl withClickImageAction:^{
            DeBugLog(@"you tap an ad view");
//            IANWebViewController *VC = [IANWebViewController new];
//            VC.title = @"这可能是一个广告页面";
//            [(UINavigationController *)self.window.rootViewController pushViewController:VC animated:YES];
        }];
        
        [startView startAnimationTime:3 WithCompletionBlock:^(IanAdsStartView *startView){
            DeBugLog(@"广告结束后，执行事件");
            [self getADUrlFromServer];
        }];
    } else { // 第一次先下载广告
        [IanAdsStartView downloadStartImage:picUrl];
        
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:userDefaultKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}

- (void)getADUrlFromServer
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageWithColor:kContentColor];
        
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
                           NSForegroundColorAttributeName : [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        textAttributes = @{
                           UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor : [UIColor blackColor],
                           UITextAttributeTextShadowColor : [UIColor clearColor],
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}


@end
