//
//  WellcomeViewController.swift
//  FlashChat
//
//  Created by Келлер Дмитрий on 04.06.2023.
//

import UIKit

final class WellcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = " "
        var charIndex = 0.0
        let titleText = K.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { [unowned self] timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
}
