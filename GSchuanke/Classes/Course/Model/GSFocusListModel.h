//
//  GSFocusListModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//FocusList

#import <Foundation/Foundation.h>

@interface GSFocusListModel : NSObject
/**
 Brief
 */
@property (nonatomic , copy) NSString *Brief;
/**
 SID
 */
@property (nonatomic , assign) NSInteger SID;
/**
 ClassNumber
 */
@property (nonatomic,assign) NSInteger ClassNumber;
/**
 ClientType
 */
@property (nonatomic,assign) NSInteger ClientType;
/**
 Cost
 */
@property (nonatomic,assign) NSInteger Cost;
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
 LinkURL
 */
@property (nonatomic , copy) NSString *LinkURL;
/**
 Pattern
 */
@property (nonatomic,assign) NSInteger Pattern;
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
 SchoolName
 */
@property (nonatomic , copy) NSString *SchoolName;
/**
 StudentNumber
 */
@property (nonatomic,assign) NSInteger StudentNumber;
/**
 Type
 */
@property (nonatomic,assign) NSInteger Type;
@end
