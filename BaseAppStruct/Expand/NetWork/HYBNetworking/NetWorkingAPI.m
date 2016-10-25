//
//  NetWorkingAPI.m
//  BaseAppStruct
//
//  Created by HaviLee on 2016/10/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "NetWorkingAPI.h"

@implementation NetWorkingAPI
static NetWorkingAPI *_netWorkClient;

+ (instancetype)sharedJSONClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _netWorkClient = [[NetWorkingAPI alloc]init];
    });
    return _netWorkClient;
}

- (void)updateBaseUrl:(NSString *)baseUrl
{
    [HYBNetworking updateBaseUrl:baseUrl];
}
- (NSString *)baseUrl
{
    return [HYBNetworking baseUrl];
}

- (void)setTimeout:(NSTimeInterval)timeout
{
    [HYBNetworking setTimeout:timeout];
}

- (void)obtainDataFromLocalWhenNetworkUnconnected:(BOOL)shouldObtain
{
    [HYBNetworking obtainDataFromLocalWhenNetworkUnconnected:shouldObtain];
}

- (void)cacheGetRequest:(BOOL)isCacheGet shoulCachePost:(BOOL)shouldCachePost
{
    [HYBNetworking cacheGetRequest:isCacheGet shoulCachePost:shouldCachePost];
}

- (unsigned long long)totalCacheSize
{
   return [HYBNetworking totalCacheSize];
}

- (void)autoToClearCacheWithLimitedToSize:(NSUInteger)mSize
{
    [HYBNetworking autoToClearCacheWithLimitedToSize:mSize];
}

- (void)clearCaches
{
    [HYBNetworking clearCaches];
}

- (void)enableInterfaceDebug:(BOOL)isDebug
{
    [HYBNetworking enableInterfaceDebug:isDebug];
}

- (void)configRequestType:(HYBRequestType)requestType
             responseType:(HYBResponseType)responseType
      shouldAutoEncodeUrl:(BOOL)shouldAutoEncode
  callbackOnCancelRequest:(BOOL)shouldCallbackOnCancelRequest
{
    [HYBNetworking configRequestType:requestType responseType:responseType shouldAutoEncodeUrl:shouldAutoEncode callbackOnCancelRequest:shouldCallbackOnCancelRequest];
}

- (void)configCommonHttpHeaders:(NSDictionary *)httpHeaders
{
    [HYBNetworking configCommonHttpHeaders:httpHeaders];
}

- (void)cancelAllRequest
{
    [HYBNetworking cancelAllRequest];
}

- (void)cancelRequestWithURL:(NSString *)url
{
    [HYBNetworking cancelRequestWithURL:url];
}

#pragma mark 业务需求


@end
