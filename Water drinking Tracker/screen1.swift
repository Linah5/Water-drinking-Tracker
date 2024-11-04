//
//  screen1.swift
//  Water drinking Tracker
//
//  Created by Linah on 25/04/1446 AH.
import SwiftUI
struct Screen1: View {
    @StateObject private var viewModel = Screen1ViewModel()
    @StateObject private var userData = UserData()
    @State private var bodyWeightText: String = "Value"

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer(minLength: 50)

               
                Image(systemName: "drop.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.cyan)
                    .padding(.bottom, 5)

                
                Text("Hydrate")
                    .bold()
                    .font(.title2)
                    .padding(.bottom, 10)

               
                Text("Start with Hydrate to record and track your daily water intake based on your needs and stay hydrated.")
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)

               
                HStack {
                    Text("Body weight")
                        .foregroundColor(Color.black)

                
                    TextField("Value", text: $bodyWeightText)
                        .keyboardType(.decimalPad)
                        .onReceive(bodyWeightText.publisher.collect()) {
                            bodyWeightText = String($0.prefix(5))
                        }
                        .onSubmit {
                            if let weight = Double(bodyWeightText) {
                                viewModel.bodyWeight = weight
                            } else {
                                viewModel.bodyWeight = 0.0
                            }
                        }
                        .frame(width: 60)
                        .padding(.leading, 10)

                    Spacer()

                   
                    Button(action: {
                        bodyWeightText = "Value"
                        viewModel.bodyWeight = 0.0
                        viewModel.intakeAmount = 0.0
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .padding(.horizontal, 10)

                Spacer(minLength: 30)

               
                Button(action: {
                    viewModel.calculateIntake()
                    viewModel.isNavigateToNext = true
                }) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                
                NavigationLink(
                    destination: Screen2(userData: userData), 
                    isActive: $viewModel.isNavigateToNext
                ) { EmptyView() }
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity)
        }
    }
}


#Preview {
    Screen1()
}
