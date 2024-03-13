//
//  3DModelViews.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI
import SceneKit

// Struct for SceneKit view
struct USDZView: UIViewRepresentable {
    let modelName: String
    var rotationAngle: CGFloat
    @Binding var busquedaPersonaje: String
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = SCNScene(named: modelName)
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = UIColor.clear
        return scnView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        let rotationAction = SCNAction.rotateBy(x: 0, y: rotationAngle, z: 0, duration: 50)
        uiView.scene?.rootNode.runAction(rotationAction)
    }
}

#Preview {
    USDZView(modelName: "EARTH.usdz", rotationAngle: 3, busquedaPersonaje: .constant("Rick"))
}
