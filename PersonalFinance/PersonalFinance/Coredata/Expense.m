//
//  Expense.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "Expense.h"
#import "Amount.h"
#import "Frequency.h"

@implementation Expense

// Insert code here to add functionality to your managed object subclass

-(instancetype)initWithContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Expense" inManagedObjectContext:context];
    return [self initWithEntity:entityDescription insertIntoManagedObjectContext:context];
}

@end
