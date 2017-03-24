//
//  GSCourseList.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//CourseList

#import <Foundation/Foundation.h>

@interface GSCourseList : NSObject
/**
 Brief
 */
@property (nonatomic , copy) NSString *Brief;
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
