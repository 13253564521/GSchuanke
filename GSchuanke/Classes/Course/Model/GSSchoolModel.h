//
//  GSSchoolModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/28.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSSchoolModel : NSObject
/**
 Brief
 */
@property (nonatomic , copy) NSString *Brief;
/**
 ChannelID
 */
@property (nonatomic,assign) NSInteger ChannelID;
/**
 CollectNumber
 */
@property (nonatomic,assign) NSInteger CollectNumber;
/**
 CourseSaleNumber
 */
@property (nonatomic,assign) NSInteger CourseSaleNumber;
/**
 CreateTime
 */
@property (nonatomic,assign) NSInteger CreateTime;
/**
 GoodRate
 */
@property (nonatomic , copy) NSString *GoodRate;
/**
 HasCollect
 */
@property (nonatomic,assign) NSInteger HasCollect;
/**
 HtmlBrief
 */
@property (nonatomic , copy) NSString *HtmlBrief;
/**
 NickName
 */
@property (nonatomic , copy) NSString *NickName;
/**
 Notice
 */
@property (nonatomic , copy) NSString *Notice;
/**
 SchoolLogoUrl
 */
@property (nonatomic , copy) NSString *SchoolLogoUrl;
/**
 SchoolName
 */
@property (nonatomic , copy) NSString *SchoolName;

/**
 PrelectNum
 */
@property (nonatomic,assign) NSInteger PrelectNum;
/**
 StudentNumber
 */
@property (nonatomic,assign) NSInteger StudentNumber;

/**
 TeacherList
 */
@property(nonatomic,strong) NSArray *TeacherList;

/**
 TotalAppraise
 */
@property (nonatomic,assign) NSInteger TotalAppraise;
@end
