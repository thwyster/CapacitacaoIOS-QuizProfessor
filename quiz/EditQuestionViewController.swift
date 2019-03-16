//
//  EditQuestionViewController.swift
//  Quiz
//

import UIKit

class EditQuestionViewController: UIViewController {
    
    @IBOutlet weak var txtQuestion: UITextField!
    @IBOutlet weak var txtAnswer1: UITextField!
    @IBOutlet weak var txtAnswer2: UITextField!
    @IBOutlet weak var txtAnswer3: UITextField!
    
    var owner : QuestionTableViewController?
    var editQuestion: Question?

    override func viewWillAppear(_ animated: Bool) {
        if editQuestion != nil {
            txtQuestion.text = editQuestion?.text
            txtAnswer1.text = editQuestion?.answers[0]
            txtAnswer2.text = editQuestion?.answers[1]
            txtAnswer3.text = editQuestion?.answers[2]
        }
    }
    
    @IBAction func onCancelClick(sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveClick(sender: AnyObject) {
        let q = Question()
        q.text = txtQuestion.text!
        q.answers.append(txtAnswer1.text!)
        q.answers.append(txtAnswer2.text!)
        q.answers.append(txtAnswer3.text!)
        
        if (editQuestion != nil) {
            owner?.editQuestion(q)
        }
        else {
            owner?.addQuestion(q)
        }
        navigationController?.popViewController(animated: true)
    }    
}
