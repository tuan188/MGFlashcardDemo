//
//  CardListViewController.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class CardListViewController: UITableViewController, CardViewControllerDelegate {
    
    var cards = [CardDto]()
    var cardService = CardService()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCards()
        
        let testSM2 = TestSM2()
        testSM2.testIntervals()
    }
    
    private func loadCards() {
        cards = cardService.getAllCards()
        tableView.reloadData()
    }
    
    // MARK: - Events
    
    @IBAction func onAddButtonClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("addCard", sender: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CardCell", forIndexPath: indexPath) as! UITableViewCell

        let card = cards[indexPath.row]
        cell.textLabel?.text = card.front
        cell.detailTextLabel?.text = card.back

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let card = cards[indexPath.row]
        self.performSegueWithIdentifier("addCard", sender: card)
    }

   

  
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let card = cards[indexPath.row]
            cardService.deleteCardByCardId(card.id)
            cards.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addCard" {
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! CardViewController
            controller.card = sender as? CardDto
            controller.delegate = self
        }
    }
    
    // MARK: - CardViewControllerDelegate
    
    func cardViewControllerDidSave(sender: CardViewController) {
        loadCards()
    }

}
