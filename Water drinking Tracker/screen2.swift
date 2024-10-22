//
//  screen2.swift
//  Water drinking Tracker
//
//  Created by Linah on 19/04/1446 AH.
//

import SwiftUI

struct screen2: View {
    let appTitle: String = "Notification Preferences"
    var body: some View {
        VStack {
            
            Text("Notification Preferences")
                .bold()
                .font(.title)
                .padding()
            Text("The start and End hour")
                .padding(.trailing,90)
                .bold()
            
            Text("")
        }
    }
}

#Preview {
    screen2()
}
