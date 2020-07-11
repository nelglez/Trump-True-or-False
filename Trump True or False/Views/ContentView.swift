//
//  ContentView.swift
//  Trump True or False
//
//  Created by Nelson Gonzalez on 7/11/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var gameController = GameController()
    @State private var count = 0
    @State private var score = 0
    @State private var gameOver = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Guess which tweets are real!").bold().font(.title).foregroundColor(.gray)
            Image(gameController.tweets[count].imageName).resizable().scaledToFit().frame(minWidth: UIScreen.main.bounds.width - 10, maxWidth: UIScreen.main.bounds.width - 10).frame(height: 200)
            
            Text("Score: \(score)")
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    if self.gameController.tweets[self.count].correctAnswer == true {
                        self.score += 1
                        Sounds.playSounds(soundfile: "congratulations.mp3")
                    } else {
                        Sounds.playSounds(soundfile: "wrong.mp3")
                    }
                    if self.count != 79 {
                    self.count += 1
                    } else {
                        self.gameOver = true
                    }
                   
                    
                }) {
                    Text("Real").padding()
                }.background(Color.blue).cornerRadius(10).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    if self.gameController.tweets[self.count].correctAnswer == false {
                        self.score += 1
                        Sounds.playSounds(soundfile: "congratulations.mp3")
                        } else {
                            Sounds.playSounds(soundfile: "wrong.mp3")
                        }
                    
                    if self.count != 79 {
                    self.count += 1
                    } else {
                        self.gameOver = true
                    }
                }) {
                    Text("Fake").padding()
                }.background(Color.blue).cornerRadius(10).foregroundColor(.white)
                
                Spacer()
            }
            
            Text("Progress: \(count + 1)/80").font(.footnote).foregroundColor(.gray)
            
        }.padding().alert(isPresented: $gameOver) {
            Alert(title: Text("Game Over!"), message: Text("You scored: \(self.score)/80"), dismissButton: .default(Text("Start Over!"), action: {
                self.count = 0
                self.score = 0
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
