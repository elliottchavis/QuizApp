//
//  ViewController.swift
//  QuizApp
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizLbl: UILabel!
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupQuestion()
        
    }
    
    @IBAction func trueBtnPressed(_ sender: Any) {
        
        let result = quiz.check(answer: true)
        
        showResult(isCorrect: result)
    }
    
    @IBAction func falseBtnPressed(_ sender: Any) {
    }
    
    func setupQuestion() {
        
        let currentQuestion = quiz.getQuestion()
        quizImageView.image = currentQuestion.image
        quizLbl.text = currentQuestion.question
        
        
    }
    
    func showResult(isCorrect correct: Bool) {
        
        let title = correct ? "Correct" : "Incorrect"
        
        let message = correct ? "You got the right answer" : "You got the wrong answer"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let nextQuestionAction = UIAlertAction(title: "Next Questions", style: .default) {
            (action) in
            
            if self.quiz.nextQuestion() {
                
                self.setupQuestion()
                
                alert.dismiss(animated: true, completion: nil)
            }
            else {
                
            }
        }
        
        alert.addAction(nextQuestionAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}

