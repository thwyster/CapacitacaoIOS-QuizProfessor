//
//  QuizTests.swift
//  QuizTests
//
//  Created by ALUNO on 10/04/19.
//  Copyright © 2019 HSBC. All rights reserved.
//

import XCTest
@testable import Quiz

class QuizTests: XCTestCase {

    var modelTest: QuizViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        modelTest =  QuizViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        modelTest = nil
    }
    
    func testNext(){
        //given
        modelTest.reset()
        
        //when
        modelTest.next()
        modelTest.next()
        modelTest.previous()
        
        //then
        XCTAssertEqual(modelTest.currentNumber, 1, "Indice da proxima questao incorreto")
        
    }
    
    func testEndOfQuestion(){
        //Given - Posicao inincial
        modelTest.reset()
        let qtd = modelTest.count
        
        //when
        for _ in 0...qtd {
            modelTest.next()
        }
        
        //then
        XCTAssertEqual(modelTest.currentNumber, modelTest.count-1, "Indice do Quiz ultrapassou o limite errado")
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
