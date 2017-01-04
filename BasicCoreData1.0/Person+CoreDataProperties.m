//
//  Person+CoreDataProperties.m
//  BasicCoreData1.0
//
//  Created by Hoang Dang Trung on 12/26/16.
//  Copyright © 2016 trunghoangdang. All rights reserved.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic age;
@dynamic name;

@end
