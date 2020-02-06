//
//  ContentView.swift
//  HangmanWatch WatchKit Extension
//
//  Created by Eric Stock on 2020-02-03.
//  Copyright © 2020 Eric. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var hangmanGame = HangmanGame()
    @State var enteredGuess: String = ""
    
    var body: some View {
        let inputBinding = Binding<String>(get: {
               self.enteredGuess
           }, set: {
               self.enteredGuess = $0
                self.hangmanGame.makeGuess(guess: $0)
                self.enteredGuess = "Enter Guess";
           })
        
        return VStack {
            Image("00\(self.hangmanGame.wrongGuesses+1)")
            Text(self.hangmanGame.currentAnswer)
            TextField("Enter Guess", text: inputBinding)
                .alert(isPresented: self.$hangmanGame.showGameOverAlert) {
                    Alert(title: self.hangmanGame.checkWin() ? Text("You Win") : Text("You Lose"), message: Text("message"))
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
