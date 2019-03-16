//
//  QuizViewController.swift
//  Quiz
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var placar: UILabel!
    
    var quiz : QuizViewModel!

    override func viewDidLoad() {
        showQuestion(quiz.current)
    }
    
    func showQuestion(_ question : Question) {
        lblQuestion.text = question.text
        btnAnswer1.setTitle(question.answers[0], for: .normal)
        btnAnswer2.setTitle(question.answers[1], for: .normal)
        btnAnswer3.setTitle(question.answers[2], for: .normal)
        
    }
    
    func next() {
        if (!quiz.isLast) {
            quiz.next()
        } else {
            self.message()
        }
        showQuestion(quiz.current)
    }
    
    func message() {
        let action = UIAlertAction(title: "Continuar",
                     style: .default) { (action) in
            self.quiz.finish()
            self.quiz.reset()
            self.navigationController?.popViewController(animated: true)
        }
        
        let alert = UIAlertController(title: "Fim!",
                                      message: "Placar: \(quiz.score)",
                                      preferredStyle: .alert)
        alert.addAction(action)
        
        self.present(alert, animated: true) {
        }
    }
    
    @IBAction func answer(_ sender: UIButton) {
        _ = quiz.checkAnswer(sender.tag-1)
        placar.text = String(quiz.score)
        
        self.next()
    }
    
}
