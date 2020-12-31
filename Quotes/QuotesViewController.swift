//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Edward Tang on 12/30/20.
//  Copyright © 2020 Edward Tang. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {

    @IBOutlet var textLabel: NSTextField!
    let quotes = Quote.all
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentQuoteIndex = 0
    }

    func updateQuote() {
        self.textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
    
    @IBAction func previous(_ sender: NSButton){
        self.currentQuoteIndex = (self.currentQuoteIndex - 1 + self.quotes.count) % quotes.count
    }

    @IBAction func next(_ sender: NSButton){
        self.currentQuoteIndex = (self.currentQuoteIndex + 1 ) % self.quotes.count
    }

    @IBAction func quit(_ sender: NSButton){
        NSApplication.shared.terminate(sender)
    }
    
}

extension QuotesViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("QuotesViewController")
        
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant I find QuotesViewController? - Check Main.storyboard")
        }
        
        return viewController
        
    }
    
}
