//
//  TimerView.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import SwiftUI

struct TimerView: View {
    private var timer = PomodoroTimer(workInSeconds: 60*25, breakInSeconds: 60*5)
    @State private var displayWarning = false
    @Environment (\.scenePhase) var scenePhase
    var body: some View{
        VStack{
            CircleTimer(fraction: timer.fractionPassed, primaryText: timer.secondsLeftString, secondaryText: timer.mode.rawValue)
            
            HStack{
                // skip
                if timer.state == .idle && timer.mode == .pause {
                    CircleButton(icon: "forward.fill"){
                        timer.skip()
                    }
                }

                // start
                if timer.state == .idle {
                    CircleButton(icon: "play.fill") {
                        timer.start()
                    }
                }
                
                // resume
                if timer.state == .paused {
                    CircleButton(icon: "play.fill") {
                        timer.resume()
                    }
                }
                
                // pause
                if timer.state == .running {
                    CircleButton(icon: "pause.fill") {
                        timer.pause()
                    }
                }
                
                // reset
                if timer.state == .running || timer.state == .paused {
                    CircleButton(icon: "stop.fill") {
                        timer.reset()
                    }
                }
            }
            
            if displayWarning == true {
                NotificationsDisabled()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(
                gradient: Gradient(colors: [Color("Light"), Color("Dark")]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
        )
        .onChange(of: scenePhase){
            if scenePhase == .active {
                PomodoroNotification.checkAuthorization {
                    authorized in
                  displayWarning = !authorized
                }
            }
        }
    }
    
}

#Preview {
    TimerView()
}
