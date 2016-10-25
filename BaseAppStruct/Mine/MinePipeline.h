//
// MinePipeline.h
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "MIPipeline.h"

@interface MinePipeline : MIPipeline

// Normal data
@property (nonatomic, strong) UserInfoDetailModel *userInfo;
// Flag data
@property (nonatomic, assign) BOOL flagRequestFinished;

// Input data
@property (nonatomic, assign) NSUInteger inputSelectedPhotoIndex;
@property (nonatomic, assign) BOOL inputFetchMoreData;

// Context data
// In general, context data is calculate property. They can be calculated
// from other property.
@property (nonatomic, strong, readonly) NSDictionary *contextForDetail;

@end
