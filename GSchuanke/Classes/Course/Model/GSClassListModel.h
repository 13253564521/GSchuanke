//
//  GSClassListModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSClassListModel : NSObject
/**
 Brief
 */
@property (nonatomic , copy) NSString *Brief;
/**
 CID
 */
@property (nonatomic,assign) NSInteger CID;
/**
 ClassIndex
 */
@property (nonatomic,assign) NSInteger ClassIndex;
/**
 ClassName
 */
@property (nonatomic , copy) NSString *ClassName;
/**
 Courseware
 */
@property (nonatomic , copy) NSString *Courseware;
/**
 OffLineID
 */
@property (nonatomic , copy) NSString *OffLineID;
/**
 PrelectStartTime
 */
@property (nonatomic,assign) NSInteger PrelectStartTime;
/**
 PrelectStatus
 */
@property (nonatomic,assign) NSInteger PrelectStatus;
/**
 PrelectTimeLength
 */
@property (nonatomic,assign) NSInteger PrelectTimeLength;

/**
 QuizList
 */
@property(nonatomic,strong) NSArray *QuizList;

/**
 StudyType
 */
@property (nonatomic,assign) NSInteger StudyType;
/**
 TeacherName
 */
@property (nonatomic,assign) NSInteger TeacherName;
/**
 TeacherUID
 */
@property (nonatomic,assign) NSInteger TeacherUID;
/**
 TrailFlag
 */
@property (nonatomic,assign) NSInteger TrailFlag;
/**
 VideoID
 */
@property (nonatomic,assign) NSInteger VideoID;
/**
 VideoStatus
 */
@property (nonatomic,assign) NSInteger VideoStatus;
/**
 VideoTimeLength
 */
@property (nonatomic,assign) NSInteger VideoTimeLength;

/**
 VideoUrl
 */
@property(nonatomic,strong) NSArray *VideoUrl;


@end
