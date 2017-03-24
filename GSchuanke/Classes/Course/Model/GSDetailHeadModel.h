//
//  GSDetailHeadModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSDetailHeadModel : NSObject
/**
 AppraiseBadCount
 */
@property (nonatomic,assign) NSInteger AppraiseBadCount;
/**
 AppraiseGoodCount
 */
@property (nonatomic,assign) NSInteger AppraiseGoodCount;
/**
 AppraiseMiddleCount
 */
@property (nonatomic,assign) NSInteger AppraiseMiddleCount;
/**
 AssureTimeLength
 */
@property (nonatomic,assign) NSInteger AssureTimeLength;
/**
 Brief
 */
@property (nonatomic , copy) NSString *Brief;
/**
 ClassHour
 */
@property (nonatomic,assign) NSInteger ClassHour;
/**
 ClassListVer
 */
@property (nonatomic,assign) NSInteger ClassListVer;
/**
 ClassNumber
 */
@property (nonatomic,assign) NSInteger ClassNumber;
/**
 Cost
 */
@property (nonatomic,assign) NSInteger Cost;
/**
 CourseID
 */
@property (nonatomic,assign) NSInteger CourseID;
/**
 CourseInfoVer
 */
@property (nonatomic,assign) NSInteger CourseInfoVer;
/**
 CourseName
 */
@property (nonatomic , copy) NSString *CourseName;
/**
 CourseType
 */
@property (nonatomic,assign) NSInteger CourseType;
/**
 Courseware
 */
@property (nonatomic , copy) NSString *Courseware;
/**
 CreateTime
 */
@property (nonatomic,assign) NSInteger CreateTime;
/**
 ExpiryTime
 */
@property (nonatomic,assign) NSInteger ExpiryTime;
/**
 IsCollect
 */
@property (nonatomic,assign) BOOL IsCollect;
/**
 KeyWords
 */
@property (nonatomic , copy) NSString *KeyWords;
/**
LiveStudentLimit
*/
@property (nonatomic,assign) NSInteger LiveStudentLimit;
/**
 PayEndTime
 */
@property (nonatomic,assign) NSInteger PayEndTime;
/**
 PayStudentLimit
 */
@property (nonatomic,assign) NSInteger PayStudentLimit;
/**
 PhotoURL
 */
@property (nonatomic , copy) NSString *PhotoURL;
/**
 SID
 */
@property (nonatomic,assign) NSInteger SID;
/**
 SaleStatus
 */
@property (nonatomic,assign) NSInteger SaleStatus;
/**
 SchoolName
 */
@property (nonatomic , copy) NSString *SchoolName;
/**
 Status
 */
@property (nonatomic,assign) NSInteger Status;


/**
 StepList
 */
@property(nonatomic,strong) NSMutableArray *StepList;

/**
 StudentNumber
 */
@property (nonatomic,assign) NSInteger StudentNumber;
/**
 TotalAppraise
 */
@property (nonatomic,assign) NSInteger TotalAppraise;
/**
 TrialNumber
 */
@property (nonatomic,assign) NSInteger TrialNumber;
/**
 Type
 */
@property (nonatomic,assign) NSInteger Type;
/**
 VideoDownload
 */
@property (nonatomic,assign) NSInteger VideoDownload;

@end
