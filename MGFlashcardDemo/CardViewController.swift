//
//  CardViewController.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

protocol CardViewControllerDelegate: class {
    func cardViewControllerDidSave(sender: CardViewController)
}


class CardViewController: UITableViewController {
    
    @IBOutlet weak var frontTextField: UITextField!

    @IBOutlet weak var backTextField: UITextField!

    weak var delegate: CardViewControllerDelegate?

    var card: CardDto?

    let cardService = CardService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let card = card {
            self.title = "Edit Card"
            frontTextField.text = card.front
            backTextField.text = card.back
        }
        
        frontTextField.becomeFirstResponder()
    }
    
    // MARK: - Events
    
    @IBAction func onCancelButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSaveButtonClicked(sender: AnyObject) {
        if card == nil {
            card = CardDto()
        }
        
        if let card = self.card {
            card.front = frontTextField.text
            card.back = backTextField.text
            
            if card.id.isEmpty { // add card
                card.id = NSUUID().UUIDString
                cardService.addCard(card)
            }
            else {
                cardService.updateCard(card)
            }
        }
        
        delegate?.cardViewControllerDidSave(self)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
