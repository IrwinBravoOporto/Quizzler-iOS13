//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiseOne: UIButton!
    @IBOutlet weak var choiseTwo: UIButton!
    @IBOutlet weak var choiseThree: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
        updateIU()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnwers = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnwers)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.countNumberQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateIU),userInfo: nil,repeats: false)
    }
    
    @objc func  updateIU(){
        questionLabel.text = quizBrain.getQuestionText()
        choiseOne.backgroundColor = UIColor.clear
        choiseTwo.backgroundColor = UIColor.clear
        choiseThree.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score:\(quizBrain.getScore())"
        
        let answerChoises = quizBrain.getAnswers()
        
        choiseOne.setTitle(answerChoises[0], for: .normal)
        choiseTwo.setTitle(answerChoises[1], for: .normal)
        choiseThree.setTitle(answerChoises[2], for: .normal)
    }
}

