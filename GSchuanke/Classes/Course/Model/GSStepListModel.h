//
//  GSStepListModel.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//StepList

#import <Foundation/Foundation.h>

@interface GSStepListModel : NSObject

/**
 ClassList
 */
@property(nonatomic,strong) NSArray *ClassList;
/**
 StepID
 */
@property (nonatomic,assign) NSInteger StepID;
/**
 StepIndex
 */
@property (nonatomic,assign) NSInteger StepIndex;

/**
 StepName
 */
@property (nonatomic , copy) NSString *StepName;

@end
