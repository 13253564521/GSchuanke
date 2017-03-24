//
//  GSCouerseModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//AlbumList

#import <Foundation/Foundation.h>

@interface GSCouerseModel : NSObject
/**
 AlbumID
 */
@property (nonatomic,assign) NSInteger AlbumID;
/**
 IpadType
 */
@property (nonatomic,assign) NSInteger IpadType;
/**
 IphoneType
 */
@property (nonatomic,assign) NSInteger IphoneType;
/**
 LinkURL
 */
@property (nonatomic , copy) NSString *LinkURL;
/**
 Pattern
 */
@property (nonatomic,assign) NSInteger Pattern;
/**
 PhotoURL
 */
@property (nonatomic , copy) NSString *PhotoURL;
/**
 ShowEndTime
 */
@property (nonatomic,assign) NSInteger ShowEndTime;

/**
 ShowStartTime
 */
@property (nonatomic,assign) NSInteger ShowStartTime;
/**
 Sort
 */
@property (nonatomic,assign) NSInteger Sort;
/**
 Title
 */
@property (nonatomic , copy) NSString *Title;
/**
 message
 */
@property (nonatomic , copy) NSString *message;


@end
