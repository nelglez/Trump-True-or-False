//
//  Sounds.swift
//  Trump True or False
//
//  Created by Nelson Gonzalez on 7/11/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//https://stackoverflow.com/questions/59404039/how-to-play-audio-using-avaudioplayer-in-swiftui-project

import Foundation
import AVFoundation

class Sounds {

  static var audioPlayer:AVAudioPlayer?

  static func playSounds(soundfile: String) {

      if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

          do {

              audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
              audioPlayer?.prepareToPlay()
              audioPlayer?.play()

          } catch {
              print("Error")
          }
      }
   }
}
