//
//  ViewController.swift
//  3DGame
//
//  Created by Michael Ray Porter, Jr on 4/26/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    @IBOutlet weak var The3DView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setup view
        The3DView.allowsCameraControl = true
        The3DView.autoenablesDefaultLighting = true
        
        //setup scene
        scnScene = SCNScene()
        scnScene.background.contents = "Background_Diffuse.png"
        The3DView.scene = scnScene
        
        //setup camera
        cameraNode = SCNNode()
        cameraNode.camera  = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scnScene?.rootNode.addChildNode(cameraNode)
        
        //add 3D object
        var geometry: SCNGeometry = SCNGeometry()
        
        //geometry = SCNSphere(radius: 0.35)
        //geometry = SCNTorus(ringRadius: 0.5, pipeRadius: 0.25)
        geometry = SCNPlane(width: 0.5, height: 0.5)
        geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        geometry = SCNCone(topRadius: 0.01, bottomRadius: 1, height: 5)
        
        geometry.firstMaterial!.diffuse.contents = "world2700x1350.jpg"
        let mySCNNode = SCNNode(geometry: geometry)
        mySCNNode.position = SCNVector3(x: 0, y: 0, z: 0)
        
        scnScene?.rootNode.addChildNode(mySCNNode)
        
    }


}

