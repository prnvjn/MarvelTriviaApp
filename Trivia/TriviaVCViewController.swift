//
//  TriviaVCViewController.swift
//  Trivia
//
//  Created by Pranav J on 9/30/23.
//

import UIKit

class TriviaVCViewController: UIViewController {

    
    @IBOutlet weak var trivaQuestion: UILabel!
    
    @IBOutlet weak var remaining: UILabel!
    
    @IBOutlet weak var option1: UIButton!
    
    @IBOutlet weak var option2: UIButton!
    
    
    @IBOutlet weak var option3: UIButton!
    
    @IBOutlet weak var option4: UIButton!
   
    private var selectedQuestionIndex = 0
    private var fakeData: [QuestionsData] = []

    private var total = 0
    private var curr = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        fakeData = createMockData()
        
        configure(with: fakeData[selectedQuestionIndex])
         
        
        remaining.text = "Question \(selectedQuestionIndex+1) / \(fakeData.count)"
//       configure()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func selectedOption(_ sender: UIButton) {
       
        let currentQuestion = fakeData[selectedQuestionIndex]
        if sender == option1 {
                  handleAnswerSelection(0, for: currentQuestion)
              } else if sender == option2 {
                  handleAnswerSelection(1, for: currentQuestion)
              } else if sender == option3 {
                  handleAnswerSelection(2, for: currentQuestion)
              } else if sender == option4 {
                  handleAnswerSelection(3, for: currentQuestion)
              }
        
        moveToNextQuestion()
        
    }

        
    func handleAnswerSelection(_ selectedOptionIndex: Int, for question: QuestionsData) {
                if selectedOptionIndex == question.correctAnswerIndex {
                    print("Correct answer!")
                } else {
                    print("Incorrect answer!")
                }
            }
    
    private func createMockData() -> [QuestionsData] {
                                  // This is just using the Calendar API to get a few random dates
                                  
                                  // Create a few mock data to show
                                  let mockData1 = QuestionsData(text: "What is the name of Tony Stark's AI assistant?",
                                                                answers: ["JARVIS", "FRIDAY", "EDITH", "ULTRON"],
                                                                correctAnswerIndex: 0)
                                  let mockData2 = QuestionsData(text: "What is the name of the talking raccoon in 'Guardians of the Galaxy'?",
                                                                answers: ["Drax", "Groot", "Star-Lord", "Rocket"],
                                                                correctAnswerIndex: 3)
                                  let mockData3 =  QuestionsData(text: "What is the name of T'Challa's sister in 'Black Panther'?",
                                                                  answers: ["Okoye", "Shuri", "Nakia", "Ramonda"],
                                                            correctAnswerIndex: 1)
                let mockData4 =  QuestionsData(text: "What is the name of Peter Parker's best friend in 'Spider-Man: Homecoming'?",answers: ["Ned", "Flash", "Harry", "Miles"],correctAnswerIndex: 0)
                                  return [mockData1, mockData2, mockData3, mockData4]
                              }
                          
    func moveToNextQuestion() {
        // Increment the current question index
       
        selectedQuestionIndex = min(fakeData.count - 1, selectedQuestionIndex + 1)
        // Check if there are more questions
        remaining.text = "Question \(selectedQuestionIndex+1) / \(fakeData.count)"
        configure(with: fakeData[selectedQuestionIndex])
        
    }
                          
                          
    private func configure(with trivia: QuestionsData) {
        trivaQuestion.text = trivia.text
        option1.setTitle(trivia.answers[0], for: .normal)
        option2.setTitle(trivia.answers[1], for: .normal)
        option3.setTitle(trivia.answers[2], for: .normal)
        option4.setTitle(trivia.answers[3], for: .normal)
     }

 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
