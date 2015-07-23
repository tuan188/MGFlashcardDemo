//
//  Mapper.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class Mapper: NSObject {
    
    class func mapCardDto(cardDto: CardDto, toCard card: Card) {
        card.id = cardDto.id
        card.creationTime = cardDto.creationTime
        card.modificationTime = cardDto.modificationTime
        card.type = cardDto.type.rawValue
        card.queue = cardDto.queue.rawValue
        card.due = cardDto.due
        card.interval = cardDto.interval
        card.factor = cardDto.factor
        card.reviews = cardDto.reviews
        card.lapses = cardDto.lapses
        card.front = cardDto.front
        card.back = cardDto.back
    }
    
    class func mapCard(card: Card, toCardDto cardDto: CardDto) {
        cardDto.id = card.id
        cardDto.creationTime = card.creationTime
        cardDto.modificationTime = card.modificationTime
        cardDto.type = CardType(rawValue: card.type.integerValue)!
        cardDto.queue = CardQueue(rawValue: card.queue.integerValue)!
        cardDto.due = card.due.integerValue
        cardDto.interval = card.interval.integerValue
        cardDto.factor = card.factor.doubleValue
        cardDto.reviews = card.reviews.integerValue
        cardDto.lapses = card.lapses.integerValue
        cardDto.front = card.front
        cardDto.back = card.back
    }
    
    class func cardDtoFromCard(card: Card) -> CardDto {
        let cardDto = CardDto()
        mapCard(card, toCardDto: cardDto)
        return cardDto
    }
}
