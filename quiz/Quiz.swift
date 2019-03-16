//
//  Quiz.swift
//  Quiz
//

import Foundation


class Quiz {
    let correct = 2   // A questão correta sempre é a última cadastrada
    
    /*private (set)*/
    var questions: [Question]
//    {
//        willSet
//        {
//            print("O conjunto de questões vai mudar")
//            print("de \(questions)")
//            print("para \(newValue).\n")
//        }
//        didSet
//        {
//            print("O conjunto de questões mudou")
//            print("de \(oldValue)")
//            print("para \(questions).\n")
//            observer?.update()
//        }
//    }
    
    func add(_ question: Question) {
        questions.append(question)
    }
    
    func remove(_ number : Int) {
        questions.remove(at: number)
    }
    
    init() {
        questions = [Question]()
        
        var question = Question()
        question.text = "Quanto a sintaxe, a linguagem é..."
        question.answers.append("Facil")
        question.answers.append("Média")
        question.answers.append("Difícil")
        self.add(question)
        
        question = Question()
        question.text = "Os recursos da linguagem são..."
        question.answers.append("Escassos")
        question.answers.append("Normais")
        question.answers.append("Completos")
        self.add(question)
        
        question = Question()
        question.text = "Eu considero a IDE XCode..."
        question.answers.append("Pobre")
        question.answers.append("Similar a outras IDEs")
        question.answers.append("Incrível")
        self.add(question)
        
        question = Question()
        question.text = "Minha percepção sobre o mercado Apple é..."
        question.answers.append("Negativa")
        question.answers.append("Similar ao Android")
        question.answers.append("Positiva")
        self.add(question)
        
        question = Question()
        question.text = "Eu considero o curso de IOS..."
        question.answers.append("Inútil")
        question.answers.append("Interessante")
        question.answers.append("Importantíssimo")
        self.add(question)
    }
}
