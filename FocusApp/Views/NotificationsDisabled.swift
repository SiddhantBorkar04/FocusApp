//
//  NotificationsDisabled.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import SwiftUI

struct NotificationsDisabled: View {
    var body: some View {
        VStack{
            Text("Notifications are disabled")
                .font(.headline)
            Text("To be notified when a pomodoro timer is over, enable notifications.")
                .font(.subheadline)
            Button("Open Settings"){
                openSettings()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color("Light"))
        .foregroundColor(Color("Dark"))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
    
    private func openSettings(){
        DispatchQueue.main.async{
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
}



#Preview {
    VStack{
        NotificationsDisabled()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("Dark"))
}
