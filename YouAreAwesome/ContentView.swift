//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Brian Bailey on 4/26/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    
    @State private var message = ""
    @State private var lastMessageNumber = -1
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    
    let numberOfImages = 10 // image0 through image9
    let numberOfSounds = 6  // sound0 through sound5
    
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
            
            Spacer()
            
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
                    imageNumber = Int.random(in: 0...(numberOfImages - 1))
                } while imageNumber == lastImageNumber
                
                message = messages[messageNumber]
                imageName = "image\(imageNumber)"
                
                lastMessageNumber = messageNumber
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...(numberOfSounds - 1))
                } while soundNumber == lastSoundNumber
                
                let soundName = "sound\(soundNumber)"
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("😡 ERROR \(error.localizedDescription) creating audioPlayer.")
                }

                lastSoundNumber = soundNumber
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
