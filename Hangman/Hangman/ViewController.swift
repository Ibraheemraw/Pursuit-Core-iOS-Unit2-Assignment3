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
    var imageArr: [UIImage]!
    
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
        print("Player1 entered \(player1UserInput.text ?? "nothing entered")")
        textField.resignFirstResponder()
        player1UserInput.isEnabled = false
        
        if textField.text == player2UserInput.text {
            hangmanWord.text = "Correct!! The Word was:2 \(player1UserInput.text ?? "Error With Code")"
        } else {
            strikesImages.image = UIImage(named: "hang1")
            print("Sorry you entered: \(player2UserInput.text ?? "default value")")}
        
        
        print("Player2 entered \(player2UserInput.text ?? "nothing entered")")
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
//             checkForHangman(player2UserInput, player1UserInput)
            return count <= 36
        default:
            print("Error")
            return true
        }
    }
    
    func checkForGuesses(_ textField: UITextField) -> Bool {
        let inputArr = Array((textField.text ?? "Error")!)
        for (index,value) in inputArr.enumerated(){
            print("index: \(index) value: \(value)")
        }
        
    return true
    }
}

