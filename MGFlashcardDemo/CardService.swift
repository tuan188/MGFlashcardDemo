//
//  CardService.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class CardService: NSObject {
    
    func addCard(cardDto: CardDto) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            let card = Card.MR_createEntityInContext(context)
            Mapper.mapCardDto(cardDto, toCard: card)
        }
    }
    
    func updateCard(cardDto: CardDto) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            var predicate = NSPredicate(format: "id = '\(cardDto.id)'")
            let card = Card.MR_findFirstWithPredicate(predicate, inContext: context)
            if card != nil {
                card.modificationTime = NSDate()
                Mapper.mapCardDto(cardDto, toCard: card)
            }
        }
    }
    
    func deleteCardByCardId(cardId: String) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            var predicate = NSPredicate(format: "id = '\(cardId)'")
            Card.MR_deleteAllMatchingPredicate(predicate, inContext: context)
        }
    }
    
    func getAllCards() -> [CardDto] {
        var cardDtos = [CardDto]()
        let cards = Card.MR_findAll()
        for card in cards {
            cardDtos.append(Mapper.cardDtoFromCard(card as! Card))
        }
        
        return cardDtos
    }
    
    func getAllCardsByDeckId(deckId: String) -> [CardDto] {
        var cardDtos = [CardDto]()
        
        var predicate = NSPredicate(format: "deck.id = '\(deckId)'")
        var cards = Card.MR_findAllWithPredicate(predicate)
        
        for card in cards {
            cardDtos.append(Mapper.cardDtoFromCard(card as! Card))
        }
        return cardDtos
    }
}
