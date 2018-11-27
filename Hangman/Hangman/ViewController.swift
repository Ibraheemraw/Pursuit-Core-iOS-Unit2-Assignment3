//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strikesImages: UIImageView!
    @IBOutlet weak var player1UserInput: UITextField!
    @IBOutlet weak var player2UserInput: UITextField! 
    @IBOutlet weak var hangmanWord: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
        player1UserInput.delegate = self
        player2UserInput.delegate = self
    
  }


}

extension ViewController: UITextFieldDelegate {
    // step 2: implement methods as needed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard
        textField.resignFirstResponder()
        
        
        //        if textField == player2LetterInput {
        //            // do cohort logic
        //            print("Correct")
        //        }
        
        print("user entered \(player1UserInput.text ?? "nothing entered")")
        
        // does not matter here is true or false
        // since textfield behaviour is on one line
        return true
    }
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        var typingRange = 1
        switch textField {
        case player1UserInput:
            guard let text = textField.text else { return true }
            let count = text.count + string.count - range.length
            return count <= 36
        case player2UserInput:
            guard let text = textField.text else { return true }
            let count = text.count + string.count - range.length
            return count <= typingRange
        default:
            print("Error")
            return true
        }
        
        
    }
    
}

