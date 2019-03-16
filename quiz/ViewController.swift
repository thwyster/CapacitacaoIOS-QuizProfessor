//
//  ViewController.swift
//  Quiz
//

import UIKit

class ViewController: UIViewController {

    var quiz : QuizViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz = QuizViewModel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz" {
            let next = segue.destination as! QuizViewController
            next.quiz = quiz
        } else if segue.identifier == "editar" {
            let next = segue.destination as! QuestionTableViewController
            next.quiz = quiz
        }
    }

}

