//
//  PomodoroAudio.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import Foundation
import AVFoundation

enum PomodoroAudioSounds{
    case done
    case tick
    
    var resource: String{
        switch self{
        case .done:
            return "bell.wav"
        case .tick:
            return "tick.wav"
        }
    }
}

class PomodoroAudio {
    private var _audioPlayer: AVAudioPlayer?
    
    func play(_ sound: PomodoroAudioSounds) {
        guard let path = Bundle.main.path(forResource: sound.resource, ofType: nil) else {
            print("Error: Resource not found: \(sound.resource)")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            _audioPlayer = try AVAudioPlayer(contentsOf: url)
            _audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}
/*
class PomodoroAudio{
    private var _audioPlayer: AVAudioPlayer?
    
    func play(_ sound: PomodoroAudioSounds) {
        let path = Bundle.main.path(forResource: sound.resource, ofType: nil)!
        let url = URL(filePath: path)
        
        do {
            _audioPlayer = try AVAudioPlayer(contentsOf: url)
            _audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
*/
