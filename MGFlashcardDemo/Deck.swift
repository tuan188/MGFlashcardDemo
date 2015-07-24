//
//  Deck.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 7/24/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class Deck: NSObject {
    private var cards: [CardDto]!
    private var cardService = CardService()
    
    var newCardCount: Int {
        get {
            var count = 0
            for card in cards {
                if card.type == CardType.New {
                    count++
                }
            }
            return count
        }
    }
    
    var reviewCount: Int {
        get {
            var count = 0
            for card in cards {
                if card.type == CardType.Learning && card.qualityResponse < 3 {
                    count++
                }
            }
            return count
        }
    }
    
    func getCards() {
        let cards = cardService.getAllCards()
        self.cards = sorted(cards){ $0.interval < $1.interval }
    }
    
    func getNextCard() -> CardDto? {
        var nextCard: CardDto!
        for card in cards {
            if card.type == CardType.New {
                if nextCard == nil {
                    nextCard = card
                }
                else if card.interval < nextCard.interval {
                    nextCard = card
                }
            }
        }
        
        if nextCard != nil {
            return nextCard
        }
        
        for card in cards {
            if card.type == CardType.Learning && card.qualityResponse < 3 {
                if nextCard == nil {
                    nextCard = card
                }
                else if card.interval < nextCard.interval {
                    nextCard = card
                }
            }
        }
        return nextCard
    }
    
    func setCardQualityResponse(card: CardDto, qr: Int) {
        card.qualityResponse = qr
        card.reviews++
        card.type = CardType.Learning
        
        let sm = SM2(eFactor: card.factor, qualityResponse: qr)
        card.interval = sm.getNextInterval(card.reviews)
        card.factor = sm.getNewEFactor()
        
        cardService.updateCard(card)
    }
}
