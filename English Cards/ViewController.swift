//
//  ViewController.swift
//  English Cards
//
//  Created by Aleksandr Vorobev on 02.07.2019.
//  Copyright © 2019 Aleksandr Vorobev. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBAction func superNewTouched(_ sender: Any) {
        LevelOfLearning.ID = 1
        openLearningScene()
    }
    @IBAction func newTouched(_ sender: Any) {
        LevelOfLearning.ID = 2
        openLearningScene()
    }
    @IBAction func inProgressTouched(_ sender: Any) {
        LevelOfLearning.ID = 3
        openLearningScene()
    }
    @IBAction func almostLearningTouched(_ sender: Any) {
        LevelOfLearning.ID = 4
        openLearningScene()
    }
    @IBAction func allWordsTouched(_ sender: Any) {
         LevelOfLearning.ID = 5
         openLearningScene()
    }
    

    func openLearningScene(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let learningViewController = storyBoard.instantiateViewController(withIdentifier: "learningControllerID") as! LearningViewController
        self.present(learningViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


}

