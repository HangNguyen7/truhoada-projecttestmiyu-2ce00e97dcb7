//
//  Person+CoreDataProperties.h
//  BasicCoreData1.0
//
//  Created by Hoang Dang Trung on 12/26/16.
//  Copyright © 2016 trunghoangdang. All rights reserved.
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *age;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
