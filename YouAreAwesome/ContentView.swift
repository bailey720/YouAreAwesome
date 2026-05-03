//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Brian Bailey on 4/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var message = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageName1 = "image0"
                let imageName2 = "image1"
                
                message = message == message1 ? message2 : message1
                imageName = imageName == imageName1 ? imageName2 : imageName1
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
