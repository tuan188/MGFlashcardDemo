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
        
        if card.deck != nil {
            cardDto.deck = deckDtoFromDeck(card.deck)
            cardDto.deckId = cardDto.deck.id
        }
    }
    
    class func cardDtoFromCard(card: Card) -> CardDto {
        let cardDto = CardDto()
        mapCard(card, toCardDto: cardDto)
        return cardDto
    }
    
    class func mapDeckDto(deckDto: DeckDto, toDeck deck: Deck) {
        deck.id = deckDto.id
        deck.creationTime = deckDto.creationTime
        deck.modificationTime = deckDto.modificationTime
        deck.title = deckDto.title
    }
    
    class func mapDeck(deck: Deck, toDeckDto deckDto: DeckDto) {
        deckDto.id = deck.id
        deckDto.creationTime = deck.creationTime
        deckDto.modificationTime = deck.modificationTime
        deckDto.title = deck.title
        
        for card in deck.cards {
            let cardDto = cardDtoFromCard(card as! Card)
            deckDto.cards.append(cardDto)
        }
    }
    
    class func deckDtoFromDeck(deck: Deck) -> DeckDto {
        let deckDto = DeckDto()
        mapDeck(deck, toDeckDto: deckDto)
        return deckDto
    }
}
