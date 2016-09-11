//
//  Account.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
-(instancetype)initWithContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Account+CoreDataProperties.h"
