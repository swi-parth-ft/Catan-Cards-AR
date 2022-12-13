//
//  ViewController.swift
//  Catan Cards AR
//
//  Created by Parth Antala on 2022-12-13.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Catan Cards", bundle: Bundle.main) {
            
            configuration.trackingImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 6
            
            print("Images Successfully Added")

            
        }
        
        
        

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
 
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0)

            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            if imageAnchor.referenceImage.name == "hay-card" {
                if let pokeScene = SCNScene(named: "art.scnassets/hay.scn") {

                    if let pokeNode = pokeScene.rootNode.childNodes.first {

                        pokeNode.eulerAngles.x = .pi / 2
                        pokeNode.eulerAngles.z = .pi / 2

                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
//
            if imageAnchor.referenceImage.name == "stone-card" {
                if let pokeScene = SCNScene(named: "art.scnassets/stone.scn") {

                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        pokeNode.scale = SCNVector3(0.0006, 0.0006, 0.0006)
                        
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if imageAnchor.referenceImage.name == "goat-card" {
                if let pokeScene = SCNScene(named: "art.scnassets/goat.scn") {

                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                       // pokeNode.scale = SCNVector3(0.0006, 0.0006, 0.0006)
                        
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if imageAnchor.referenceImage.name == "wood-card" {
                if let pokeScene = SCNScene(named: "art.scnassets/wood.scn") {

                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                       // pokeNode.scale = SCNVector3(0.0006, 0.0006, 0.0006)
                        
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if imageAnchor.referenceImage.name == "brick-card" {
                if let pokeScene = SCNScene(named: "art.scnassets/bricks.scn") {

                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                       // pokeNode.scale = SCNVector3(0.0006, 0.0006, 0.0006)
                        
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            
            
            
            
        }
        
        
        
        return node
        
    }
    
}
