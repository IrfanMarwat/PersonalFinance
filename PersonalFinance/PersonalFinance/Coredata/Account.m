//
//  Account.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "Account.h"
#import <Foundation/Foundation.h>

@implementation Account

// Insert code here to add functionality to your managed object subclass

-(instancetype)initWithContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Account" inManagedObjectContext:context];
    return [self initWithEntity:entityDescription insertIntoManagedObjectContext:context];
}

@end
