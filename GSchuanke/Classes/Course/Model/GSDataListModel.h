//
//  GSDataListModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//评论model

#import <Foundation/Foundation.h>

@interface GSDataListModel : NSObject
/**
 AddVoteText
 */
@property (nonatomic , copy) NSString *AddVoteText;
/**
 AddVoteTime
 */
@property (nonatomic,assign) NSInteger AddVoteTime;
/**
 Appraise
 */
@property (nonatomic,assign) NSInteger Appraise;
/**
 Avatar
 */
@property (nonatomic , copy) NSString *Avatar;
/**
 CourseID
 */
@property (nonatomic,assign) NSInteger CourseID;
/**
 CourseName
 */
@property (nonatomic , copy) NSString *CourseName;
/**
 CreateTime
 */
@property (nonatomic,assign) NSInteger CreateTime;
/**
 IsAnoy
 */
@property (nonatomic,assign) BOOL IsAnoy;

/**
 NickName
 */
@property (nonatomic , copy) NSString *NickName;
/**
 OID
 */
@property (nonatomic,assign) NSInteger OID;

/**
 ReplayIP
 */
@property (nonatomic,assign) NSInteger ReplayIP;

/**
 ReplayText
 */
@property (nonatomic , copy) NSString *ReplayText;
/**
 SID
 */
@property (nonatomic,assign) NSInteger SID;

/**
 UpdateTime
 */
@property (nonatomic,assign) NSInteger UpdateTime;
/**
 VoteID
 */
@property (nonatomic,assign) NSInteger VoteID;
/**
 VoteText
 */
@property (nonatomic , copy) NSString *VoteText;

/**
 格式化时间
 */
@property (nonatomic,copy) NSString *CreateTimeToDate;

/**
 动态计算出cell的高度
 */
@property (nonatomic,assign) float cellHeight;

@end
