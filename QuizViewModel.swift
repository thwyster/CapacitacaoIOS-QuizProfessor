//
//  QuizDAO.swift
//  Quiz
//

import Foundation

class QuizViewModel: Observer {
    
    private let quiz: Quiz = Quiz()
    
    private (set) var currentNumber = 0
    private (set) var score = 0
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Perguntas.plist")
    
    var questions : [Question] {
        return quiz.questions
    }
    
    var current : Question {
        return quiz.questions[currentNumber]
    }
    
    var isLast : Bool {
        return currentNumber == quiz.questions.count - 1
    }
    
    var isFirst : Bool {
        return currentNumber == 0
    }
    
    var count : Int {
        return quiz.questions.count
    }
    
    init() {
        quiz.addObserver(self)
    }
    
    func reset() {
        currentNumber = 0
        score = 0
    }
    
    func checkAnswer(_ choice: Int) -> Bool {
        
        if choice == quiz.correct {
            score += 1
            return true
        }
        
        return false
    }
    
    func next() {
        if currentNumber < quiz.questions.count - 1 {
            currentNumber+=1
        }
    }
    
    func previous() {
        if currentNumber > 0 {
            currentNumber-=1
        }
    }
    
    func add(_ question: Question) {
        quiz.add(question)
    }
    
    func remove(_ number : Int) {
        quiz.remove(number)
    }
    
    func loadData() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                quiz.questions = try decoder.decode([Question].self, from: data)
            } catch {
                print("Erro bla bla: \(error)")
            }
            
        }
    }
    
    func saveData() {
        let perguntas: [Question] = self.questions
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(perguntas)
            try data.write(to: dataFilePath!)
        } catch {
            print("Erro bla bla")
        }
    }
    
    func update() {
        
    }
}
