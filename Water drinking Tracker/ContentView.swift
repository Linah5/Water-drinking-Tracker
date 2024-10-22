//
//  ContentView.swift
//  Water drinking Tracker
//
//  Created by Linah on 16/04/1446 AH.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var bodyWeight = ""

    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer(minLength: 50)
            
            Image(systemName: "drop.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.cyan)
                .padding(.bottom, 5)
                //.Spacer()
            Text("Hydrate")
                .bold()
                .padding(.bottom, 10)
                
            Text("Start with your Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                .bold()
                .fontWeight(.light)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)

            HStack {
                Text("Body weight")
                    .foregroundColor(Color.black)

                Spacer()// ليه اذا

                Text("Value")
                    .foregroundColor(Color.black)

                TextField("", text: $bodyWeight)
                    .foregroundColor(.black)
                    .keyboardType(.decimalPad)
                    .frame(width: 40)
                    .padding(.leading, 10)

                Spacer()

                Button(action: {
                    bodyWeight = ""
                }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(Color.gray)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .background(Color.gray.opacity(0.2))

            Spacer(minLength: 30)
        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity)

        VStack {
            Spacer()

            Button(action: {
                // Action for "Next"
            }) {
                HStack {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
           
        }
        
    }
}

#Preview {
    ContentView()
}
