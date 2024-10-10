//
//  CalculatorViewModel.swift
//  CalculatorTest
//
//  Created by Trentium Solution on 08/10/24.
//

import Foundation

// View Model -> add all the Logic here
class CalculatorViewModel : ObservableObject{
    
    //MARK: Objects
    @Published var display = "0"
    
    var firstOperand : Double = 0
    var currentOperation : CalculatorButton?
    var shouldResetDisplay = false
    
    //MARK: Button Action
    func handleButtonPress(_ button: CalculatorButton){
        //switch case for which button is pressed
        switch button{
        case .zero,.one,.two,.three,.four,.five,.six,.seven,.eight,.nine:
            appendDigit(button.rawValue)
            
        case .plus,.minus,.multiply,.divide:
            prepareForOperation(button)
        case .equals:
            calculateResualt()
        case .clear:
            clearDisplay()
        }
    }
    
    //MARK: Append Clickable buttons in Input TextField
    private func appendDigit(_ digit: String){
        guard !shouldResetDisplay else{
            display = digit
            shouldResetDisplay = false
            return
        }
        display = display == "0" ? digit : display + digit
    }
    
    //check for the first Added value
    private func prepareForOperation(_ button: CalculatorButton){
        if let _ = currentOperation {
            calculateResualt()
        }
        
        firstOperand = Double(display) ?? 0
        currentOperation = button
        shouldResetDisplay = true
    }
    
    //MARK: Operator Functions
    private func calculateResualt(){
        if let operation = currentOperation {
            let value = Double(display)!
            switch operation{
            case .plus:
                display = String(self.additionalCalculation(value: value))
            case .minus:
                display = String(self.substractionCalculation(value: value))
            case .multiply:
                display = String(self.multipleCalculation(value: value))
            case .divide:
                display = String(self.devideCalculation(value: value))
            default:
                break
            }
        }
        shouldResetDisplay = true
        currentOperation = nil
    }
    
    func additionalCalculation(value: Double)-> Double{
        return Double(firstOperand + value)
    }
    
    func substractionCalculation(value: Double)-> Double{
        return Double(firstOperand - value)
    }
    
    func multipleCalculation(value: Double)-> Double{
        return Double(firstOperand * value)
    }
    
    func devideCalculation(value: Double)-> Double{
        return Double(firstOperand / value)
        
    }
    
    private func clearDisplay(){
        display = "0"
        firstOperand = 0
        currentOperation = nil
    }
    
}
