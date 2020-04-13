//
//  ExampleCardInputViewController.swift
//  TapCardInputKit-Example
//
//  Created by Osama Rabie on 13/04/2020.
//  Copyright © 2020 Tap Payments. All rights reserved.
//

import UIKit
import TapCardInputKit_iOS
import CommonDataModelsKit_iOS

class ExampleCardInputViewController: UIViewController {

    @IBOutlet weak var cardInput: TapCardInput!
    @IBOutlet weak var expandedHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultTextView: UITextView!
    
    var themeDictionaty:NSDictionary?
    lazy var isInline:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInput.translatesAutoresizingMaskIntoConstraints = false
        
        self.title = isInline ? "Inline Input" : "Expanded Input"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        expandedHeightConstraint.constant = isInline ? 45 : 150
        self.view.layoutIfNeeded()
        
        cardInput.delegate = self
        cardInput.setup(for: (isInline ? .InlineCardInput : .FullCardInput), withDictionaryTheme: themeDictionaty)
    }

}


extension ExampleCardInputViewController: TapCardInputProtocol {
   
    func cardDataChanged(tapCard: TapCard) {
        resultTextView.text = "Card Number : \(tapCard.tapCardNumber ?? "")\nCard Name : \(tapCard.tapCardName ?? "")\nCard Expiry : \(tapCard.tapCardExpiryMonth ?? "")/\(tapCard.tapCardExpiryYear ?? "")\nCard CVV : \(tapCard.tapCardCVV ?? "")\n\(resultTextView.text ?? "")\n"
    }
    
    func scanCardClicked() {
        resultTextView.text = "SCAN CLICKED\n\(resultTextView.text ?? "")\n";
    }
    
    
}