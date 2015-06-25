//
//  Deck.h
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Card;

@interface Deck : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSDate * creationTime;
@property (nonatomic, retain) NSDate * modificationTime;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *cards;
@end

@interface Deck (CoreDataGeneratedAccessors)

- (void)addCardsObject:(Card *)value;
- (void)removeCardsObject:(Card *)value;
- (void)addCards:(NSSet *)values;
- (void)removeCards:(NSSet *)values;

@end
