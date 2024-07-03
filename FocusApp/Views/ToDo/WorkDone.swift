//
//  WorkDone.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import SwiftUI

struct WorkDone: View {
    var body: some View {
        VStack{
            Image(systemName: "checklist.checked")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
            Text("Nothing to do right now!")
                .font(.headline)
        }
    }
}

#Preview {
    WorkDone()
}
