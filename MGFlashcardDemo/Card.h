//
//  Card.h
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Deck.h"

@class NSManagedObject;

@interface Card : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSDate * creationTime;
@property (nonatomic, retain) NSDate * modificationTime;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * queue;
@property (nonatomic, retain) NSNumber * due;
@property (nonatomic, retain) NSNumber * interval;
@property (nonatomic, retain) NSNumber * factor;
@property (nonatomic, retain) NSNumber * reviews;
@property (nonatomic, retain) NSNumber * lapses;
@property (nonatomic, retain) NSString * front;
@property (nonatomic, retain) NSString * back;
@property (nonatomic, retain) Deck *deck;

@end
