//
//  ViewController.swift
//  English Cards
//
//  Created by Aleksandr Vorobev on 02.07.2019.
//  Copyright © 2019 Aleksandr Vorobev. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var buttonLevelId:Int?
    
    @IBAction func buttonSuperNewTouched(_ sender: Any) {
        buttonLevelId = 1
        performSegue(withIdentifier: "ShowLearningScene", sender: nil)
    }
    
    @IBAction func buttonNewTouched(_ sender: Any) {
        buttonLevelId = 2
        performSegue(withIdentifier: "ShowLearningScene", sender: nil)
    }
    
    @IBAction func buttonInProgressTouched(_ sender: Any) {
        buttonLevelId = 3
        performSegue(withIdentifier: "ShowLearningScene", sender: nil)
    }
    
    @IBAction func buttonAlmostLearnedTouched(_ sender: Any) {
        buttonLevelId = 4
        performSegue(withIdentifier: "ShowLearningScene", sender: nil)
    }
    
    @IBAction func buttonAllWordsTouched(_ sender: Any) {
        buttonLevelId = 5
        performSegue(withIdentifier: "ShowLearningScene", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? LearningViewController, segue.identifier == "ShowLearningScene" {
            controller.levelOfStudying = buttonLevelId
        }
    }
    
//
//    func openLearningScene(){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let learningViewController = storyBoard.instantiateViewController(withIdentifier: "learningControllerID") as! LearningViewController
//        self.present(learningViewController, animated: true, completion: nil)
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


}

