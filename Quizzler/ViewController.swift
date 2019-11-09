//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    let allQuestions = QuestionBank()
    var qusetionNumber: Int = 0
    var score : Int = 0
    var pickedAnswer : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
       let firstQ = allQuestions.list[0].questionText
        questionLabel.text = firstQ
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1
        {pickedAnswer = true}
        else if sender.tag == 2
        {  pickedAnswer = false}
        
        checkAnswer()
        qusetionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(qusetionNumber+1) / 13"
        progressBar.frame.size.width = view.frame.size.width * CGFloat(qusetionNumber + 1 )/13
    }
    

    func nextQuestion() {
        if(qusetionNumber <= 12)
        {
            questionLabel.text = allQuestions.list[qusetionNumber].questionText
            updateUI()
        }
        else
        {
            let alert = UIAlertController(title: "hey", message: "you have finished your number of Q's , do you wnat to start over", preferredStyle: .alert)
           
            alert.addAction(UIAlertAction(title: "Okay",
                                          style: UIAlertActionStyle.default,
                                          handler: {(alert: UIAlertAction!) in self.startOver()}))
       
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
      if allQuestions.list[qusetionNumber].answer == pickedAnswer
        {
       ProgressHUD.showSuccess("Correct")
        score += 1
        }
        else if allQuestions.list[qusetionNumber].answer != pickedAnswer
        {
        ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
        qusetionNumber = 0
        score = 0
     nextQuestion()
        
    }
    

    
}
