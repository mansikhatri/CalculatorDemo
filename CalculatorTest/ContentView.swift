//
//  ContentView.swift
//  CalculatorTest
//
//  Created by Trentium Solution on 07/10/24.
//

import SwiftUI

enum CalculatorButton : String{
    case zero = "0",
         one = "1",
         two = "2",
         three = "3",
         four = "4",
         five = "5",
         six = "6",
         seven = "7",
         eight = "8",
         nine = "9"
    case equals = "=",
         plus = "+",
         minus = "-",
         multiply = "X",
         divide = "/"
    case clear = "AC"
    
    var isNumeric : Bool {
        return Double(self.rawValue) != nil
    }
    
    var isOperation : Bool{
        switch self {
        case .plus, .minus, .multiply, .divide:
            return true
        default:
            return false
        }
    }
    
}

struct ContentView: View {
    
    //Object Creation    
    @StateObject private var viewModel = CalculatorViewModel()
    
    let buttons: [[CalculatorButton]] = [
        [],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .equals, .clear, .divide]
    ]
    
    //SetUp UI
    var body: some View {
        NavigationStack{
            VStack{ //for vertical space
                HStack{ // for horizonatal space
                    Spacer()
                    Text(viewModel.display) // for input values
                        .foregroundStyle(.black)
                        .padding()
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .font(.system(size: 64))
                        .padding(.horizontal)
                }
                .padding()
                
                // Add buttons
                ForEach(buttons, id: \.self){row in
                    HStack{
                        ForEach(row, id:\.self){button in
                            Button{
                                viewModel.handleButtonPress(button) // button action
                            }label:{
                                Text(button.rawValue)
                                    .font(.title)
                                    .frame(width:150,height:100)
                                    .foregroundStyle(.white)
                            }
                            .frame(width:75,height:75)
                            .background(Color(.black))
                            .cornerRadius(37.5)
                        }
                    }
                    
                }
            }
            .frame(maxWidth:.infinity)
            .padding(.all)
        }
        
    }
}


#Preview {
    ContentView()
}
