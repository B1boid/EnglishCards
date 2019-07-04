//
//  LearningViewController.swift
//  English Cards
//
//  Created by Aleksandr Vorobev on 03.07.2019.
//  Copyright © 2019 Aleksandr Vorobev. All rights reserved.
//

import UIKit
import RealmSwift

class LearningViewController: UIViewController,UITextFieldDelegate {

    @IBAction func seeAnswerTouched(_ sender: Any) {
        if curArray.count > index {
            secondWord.text = curArray[index].tranWord
        }
    }
    @IBAction func levelDownTouched(_ sender: Any) {
        if curArray.count > index && curArray[index].levelOfStudying > 1 {
            updateDB(value: -1)
        }
        updateUI()
    }
    @IBAction func levelUpTouched(_ sender: Any) {
        if curArray.count > index {
            if curArray[index].levelOfStudying == 4 {
                try! realm.write() {
                    realm.delete(curArray[index])
                }
            }else{
                updateDB(value: 1)
            }
            updateUI()
        }
    }
    
    
    @IBOutlet weak var firstWord: UILabel!
    
    @IBOutlet weak var secondWord: UILabel!
    
    @IBOutlet weak var imageChecker: UIImageView!
    
    @IBOutlet weak var wordField: UITextField!
    
    
    var realm : Realm!
    
    lazy var wordsArray: Results<Words> = { self.realm.objects(Words.self) }()
    
    var curArray:[Words] = []
    var index = 0
    
    override func viewDidLoad() {
        wordField.becomeFirstResponder()
        wordField.delegate = self
        realm = try! Realm()
        for words in wordsArray{
            if words.levelOfStudying == LevelOfLearning.ID || LevelOfLearning.ID == 5 {
                curArray.append(words)
            }
        }
        imageChecker.image = nil
        curArray.shuffle()
        if curArray.count > 0 {
            firstWord.text = curArray[index].engWord
        }else{
            firstWord.text = "No words"
        }
    }
    
    func updateUI() {
        index+=1
        secondWord.text = ""
        wordField.text = ""
        if curArray.count <= index {
            firstWord.text = "No words"
        }else{
            firstWord.text = curArray[index].engWord
        }
    }
    
    func updateDB(value:Int) {
        try! realm.write() {
            let newWord = Words()
            newWord.engWord = curArray[index].engWord
            newWord.tranWord = curArray[index].tranWord
            newWord.levelOfStudying = curArray[index].levelOfStudying + value
            realm.delete(curArray[index])
            realm.add(newWord)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wordField.resignFirstResponder()
        if curArray.count > index {
            if textField.text == curArray[index].tranWord {
                secondWord.text = curArray[index].tranWord
                imageChecker.image = UIImage(named: "true")
            }else{
                imageChecker.image = UIImage(named: "false")
            }
            _ = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(clearImage), userInfo: nil, repeats: false)
        }
        return true
    }
    
    @objc func clearImage(){
        imageChecker.image = nil
    }
    
    
}
