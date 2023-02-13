//
//  Alerts.swift
//  TicTacToe
//
//  Created by Tommy on 1/28/23.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext{
    static let userWin     = AlertItem(title: Text("You win!"),
                            message: Text("You are so smart"),
                            buttonTitle: Text("Oh, yeah"))
    
    static let computerWin = AlertItem(title: Text("You lost!"),
                            message: Text("AI is smarter than you"),
                            buttonTitle: Text("Rematch"))
    
    static let draw        = AlertItem(title: Text("Draw!"),
                            message: Text("What an interesting battle..."),
                            buttonTitle: Text("Try again"))
}
