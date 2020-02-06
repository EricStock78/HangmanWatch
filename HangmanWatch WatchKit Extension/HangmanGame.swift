//
//  HangmanGame.swift
//  HangmanWatch WatchKit Extension
//
//  Created by Eric Stock on 2020-02-03.
//  Copyright © 2020 Eric. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class HangmanGame: ObservableObject {
    @Published var wrongGuesses: Int = 0
    @Published var currentAnswer: String = ""
    @Published var showGameOverAlert = false;
    
    var correctAnswer = "BUCKETS"
    var correctGuesses = [Character]()
    
    init() {
        buildCurrentAnswerInProgress()
    }
    
    
    func makeGuess( guess: String) {
        // ES.. I am checking if the first character from the guess
        // is contained in the word.  If it is, I update the state of my answer (ex __d__f, and I check to see if I have won the game
        // if the guess is wrong, I increment the wrong guesses and check if the game is lost
        
        if( correctAnswer.contains(guess[guess.startIndex])) {
            
        }
        else {
            wrongGuesses += 1;
            showGameOverAlert = checkLose();
        }
    }
    
    func buildCurrentAnswerInProgress() {
        //ES... I build up a string which contains _ for unguessed characters in the correct word
        
        print(currentAnswer);
    }
    
    func checkWin() -> Bool {
        return currentAnswer == correctAnswer;
    }
    
    func checkLose() -> Bool {
        return wrongGuesses >= 7
    }
}

