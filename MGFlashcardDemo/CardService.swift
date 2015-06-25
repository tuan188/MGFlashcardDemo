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
            let card = Card.MR_createEntityInContext(context)
            Mapper.mapCardDto(cardDto, toCard: card)
        }
    }
    
    func deleteCardByCardId(cardId: String) {
        
    }
    
    func getAllCards() -> [CardDto] {
        var cards = [CardDto]()
        
        return cards
    }
    
    func getAllCardsByDeckId(deckId: String) -> [CardDto] {
        var cards = [CardDto]()
        
        return cards
    }
    
   
}
