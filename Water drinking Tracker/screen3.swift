//
//  screen3.swift
//  Water drinking Tracker
//
//  Created by Linah on 20/04/1446 AH.
//
import SwiftUI

struct Screen3: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Today's Water Intake")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)

                HStack(spacing: 5) {
                    Text("\(String(format: "%.1f", userData.waterIntake))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(userData.waterIntake >= userData.needLiters ? .green : .primary)
                    
                    Text("Liters")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(userData.waterIntake >= userData.needLiters ? .green : .primary)
                    
                    Text("/ \(String(format: "%.1f", userData.intakeAmount)) Liters")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
            }
            .padding(.trailing, 80)
            .padding(.bottom, 50)

            
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 25)
                    .frame(width: 300, height: 300)

                Circle()
                    .trim(from: 0, to: max(0.001, CGFloat(userData.waterIntake / userData.intakeAmount)))
                    .stroke(Color.cyan, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 300, height: 300)

                Image(systemName: userData.getIconName())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.yellow)
            }
            .padding(.bottom, 50)

          
            Text("\(String(format: "%.1f", userData.waterIntake)) Liters")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            
            Stepper(value: $userData.waterIntake, in: 0...userData.intakeAmount, step: 0.1) {
                Text("")
            }
            .padding(.trailing, 40)
            .padding(.horizontal, 100)
            .accentColor(.cyan)
        }
        .padding()
    }
}


#Preview {
    Screen3(userData: UserData())
}
