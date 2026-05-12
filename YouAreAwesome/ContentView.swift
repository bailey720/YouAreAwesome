//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Brian Bailey on 4/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    
    @State private var message = ""
    @State private var lastMessageNumber = -1
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You are Awesome!",
                                "When the Genious Bar Needs Help, They Call You!",
                                "You are Great!",
                                "Fabulous? That's You!",
                                "You are Incredible!"]
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...(messages.count - 1))
                } while messageNumber == lastMessageNumber
                
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                
                message = messages[messageNumber]
                imageName = "image\(imageNumber)"
                
                lastMessageNumber = messageNumber
                lastImageNumber = imageNumber
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
