//
//  ContentView.swift
//  PanelTracking
//
//  Created by Anael Aguayo-Chong on 4/12/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let configuration = ARWorldTrackingConfiguration()
        guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "scan1", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        configuration.detectionObjects = referenceObjects
        arView.session.run(configuration)
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            if let objectAnchor = anchor as? ARObjectAnchor {
                addModel(for: objectAnchor, session:session)
            }
        }
    }
    
    func addModel(for objectAnchor: ARObjectAnchor, session:ARSession) {
        let modelEntity = try! ModelEntity.loadModel(named:"scan1")
        modelEntity.transform.matrix = objectAnchor.transform
        
        let arView = session.delegate as? ARView
        arView?.scene.addAnchor(modelEntity)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
