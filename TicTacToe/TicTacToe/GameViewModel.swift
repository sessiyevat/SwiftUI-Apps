//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Tommy on 1/28/23.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameboardDisabled = false
    @Published var alertItem: AlertItem?
    
    
    func processPlayerMove(for position: Int) {
        //user move processing
        if isCircleOccupied(in: moves, forIndex: position) { return }
        moves[position] = Move(player: .user , boardInd: position)
        
        if checkWinCondition(for: .user, in: moves) {
            alertItem = AlertContext.userWin
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            return
        }
        
        isGameboardDisabled = true
        
        //computer move processing
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) { [self] in
            let computerPosition = computerMovePosition(in: moves)
            moves[computerPosition] = Move(player: .computer, boardInd: computerPosition)
            isGameboardDisabled = false
            
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertContext.computerWin
                return
            }
            if checkForDraw(in: moves) {
                alertItem = AlertContext.draw
                return
            }
        }
    }
    
    
    func isCircleOccupied(in moves: [Move?], forIndex index: Int) -> Bool{
        return moves.contains(where: { $0?.boardInd == index })
    }
    
    func computerMovePosition(in moves: [Move?] ) -> Int {
        //if AI can win, then win
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        
        let computerMoves = moves.compactMap{$0}.filter{$0.player == .computer}
        let computerPositions = Set(computerMoves.map{$0.boardInd})
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPositions)
            
            if winPositions.count == 1 {
                let isAvailable = !isCircleOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        
        //if AI can't win, then block
        let userMoves = moves.compactMap{$0}.filter{$0.player == .user}
        let userPositions = Set(userMoves.map{$0.boardInd})
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(userPositions)
            
            if winPositions.count == 1 {
                let isAvailable = !isCircleOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        
        //if AI can't block, then take middle square
        if !isCircleOccupied(in: moves, forIndex: 4){
            return 4
        }
        
        
        //if AI can't take middle square, take random available square
        var movePosition = Int.random(in: 0..<9)
        
        while isCircleOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool{
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        
        let playersMoves = moves.compactMap{$0}.filter{$0.player == player}
        let playerPositions = Set(playersMoves.map{$0.boardInd})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) {
            return true
        }
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{$0}.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
