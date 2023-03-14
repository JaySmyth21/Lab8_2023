//
//  ContentView.swift
//  Lab8_2023
//
//  Created by IMD 224 on 2023-03-14.
//

import SwiftUI
import RealityKit
struct ARViewContainer: UIViewRepresentable {
    let WorldAnchor: Experience.World
    @Binding var score: Int
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        
        
        // Add the box anchor to the scene
        self.WorldAnchor.actions.horseWasHit.onAction = {
            entity in print("horse was Hit \(score)"); score+=1
                            
        }
        arView.scene.anchors.append(WorldAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ContentView : View {
    @State var score = 0
    
    let WorldAnchor = try! Experience.loadWorld()
    var body: some View {
        
        
        
        
        VStack{
            ARViewContainer(WorldAnchor: WorldAnchor ,score: $score).edgesIgnoringSafeArea(.all)
            Button("Orbit"){
                
                WorldAnchor.notifications.orbitChess.post()
        }
            Text(String(score))
        }
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
