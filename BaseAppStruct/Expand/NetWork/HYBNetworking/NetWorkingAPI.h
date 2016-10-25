//
//  NetWorkingAPI.h
//  BaseAppStruct
//
//  Created by HaviLee on 2016/10/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYBNetworking.h"

@interface NetWorkingAPI : NSObject


#pragma mark 网络配置
+ (instancetype)sharedJSONClient;

- (void)updateBaseUrl:(NSString *)baseUrl;

- (NSString *)baseUrl;

- (void)setTimeout:(NSTimeInterval)timeout;

- (void)obtainDataFromLocalWhenNetworkUnconnected:(BOOL)shouldObtain;

- (void)cacheGetRequest:(BOOL)isCacheGet shoulCachePost:(BOOL)shouldCachePost;

- (unsigned long long)totalCacheSize;

- (void)autoToClearCacheWithLimitedToSize:(NSUInteger)mSize;

- (void)clearCaches;

- (void)enableInterfaceDebug:(BOOL)isDebug;

- (void)configRequestType:(HYBRequestType)requestType
             responseType:(HYBResponseType)responseType
      shouldAutoEncodeUrl:(BOOL)shouldAutoEncode
  callbackOnCancelRequest:(BOOL)shouldCallbackOnCancelRequest;


- (void)configCommonHttpHeaders:(NSDictionary *)httpHeaders;

- (void)cancelAllRequest;

- (void)cancelRequestWithURL:(NSString *)url;

#pragma mark 业务需求



@end
