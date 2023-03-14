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
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(WorldAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ContentView : View {
    let WorldAnchor = try! Experience.loadWorld()
    var body: some View {
        
        
        ARViewContainer(WorldAnchor: WorldAnchor).edgesIgnoringSafeArea(.all)
        
        VStack{
            Button("Orbit"){
                WorldAnchor.notifications.orbitChess.post()
        }
        
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
