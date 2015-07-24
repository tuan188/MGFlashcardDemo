//
//  FlashcardViewController.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 7/24/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var cardCountLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    @IBOutlet weak var wrongButton: UIButton!
    
    @IBOutlet weak var unsureButton: UIButton!
    
    @IBOutlet weak var correctButton: UIButton!
    
    var card: CardDto?
    var showAnswer = false
    var deck: Deck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        deck = Deck()
        deck.getCards()
        card = deck.getNextCard()
        showAnswer = false
        
        configView()
    }

    private func configView() {
        if showAnswer && card != nil {
            frontLabel.text = card!.front
            backLabel.text = card!.back
            wrongButton.hidden = false
            correctButton.hidden = false
            unsureButton.setTitle("Unsure", forState: UIControlState.Normal)
            
        }
        else {
            frontLabel.text = card?.front
            backLabel.text = nil
            wrongButton.hidden = true
            correctButton.hidden = true
            unsureButton.setTitle("Show Answer", forState: UIControlState.Normal)
        }
        unsureButton.enabled = card != nil
        
        cardCountLabel.text = "New Card: \(deck.newCardCount)"
        reviewLabel.text = "Review: \(deck.reviewCount)"
        
        if card == nil {
            let alertView = UIAlertView(title: "There are no cards to learn", message: nil, delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    private func setCardQualityResponse(qr: Int) {
        if card != nil {
            deck.setCardQualityResponse(card!, qr: qr)
            card =  deck.getNextCard()
            showAnswer = false
            configView()
        }
    }
    
    @IBAction func onWrongButtonClicked(sender: AnyObject) {
        setCardQualityResponse(0)
    }
    
    @IBAction func onUnsureButtonClicked(sender: AnyObject) {
        showAnswer = !showAnswer
        if showAnswer {
            configView()
        }
        else {
            setCardQualityResponse(2)
        }
        
    }

    @IBAction func onCorrectButtonClicked(sender: AnyObject) {
        setCardQualityResponse(5)
    }
    
}
