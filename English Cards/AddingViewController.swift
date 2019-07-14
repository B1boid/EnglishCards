//
//  NewViewController.swift
//  English Cards
//
//  Created by Aleksandr Vorobev on 02.07.2019.
//  Copyright © 2019 Aleksandr Vorobev. All rights reserved.
//

import UIKit
import RealmSwift

class AddingViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var englishWord: UITextField!
    @IBOutlet var translationWord: UITextField!
    
    @IBOutlet weak var successLabel: UILabel!
    
    var realm : Realm?
    
    lazy var wordsArray: Results<Words> = { self.realm!.objects(Words.self) }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        englishWord.becomeFirstResponder()
        englishWord.delegate = self
        translationWord.delegate = self
        realm = try? Realm()
        successLabel.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == englishWord {
            translationWord.becomeFirstResponder()
        }else {
            try? realm!.write() {
                let newWord = Words()
                newWord.engWord = englishWord.text!
                newWord.tranWord = translationWord.text!
                newWord.levelOfStudying = 1
                self.realm!.add(newWord)
                englishWord.text = ""
                translationWord.text = ""
                successLabel.text = "Word added"
                englishWord.becomeFirstResponder()
                _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeLabelClear), userInfo: nil, repeats: false)

            }
        }
        return true
    }
    
    @objc func makeLabelClear(){
        successLabel.text = ""
    }
   
    
}

