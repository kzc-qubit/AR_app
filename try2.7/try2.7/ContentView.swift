//
//  ContentView.swift
//  try2.7
//
//  Created by Ray Chen on 2/7/23.
//
import UIKit
import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @State private var isPlacementEnabled = false
    
    @State private var showOptions = false
	@State private var showModels = false

	// for message bar
    @State private var document: MessageDocument = MessageDocument(message: "Try 2.7")
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool = false

	// for remove AR Model
	@State private var show = false
	
	
	
	
//	var models: [String] = ["fender_stratocaster", "teapot", "pannel"]

	
	
	// all the file names
	private var models: [String]  = {
		// dynamically get the file name
		let filemanager = FileManager.default

		guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else {
			return []
		}

		var availablemodels: [String] = []
		for filename in files where filename.hasSuffix("usdz"){
			let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
			availablemodels.append(modelName)
		}
		return availablemodels
	}()
	

	
    var body: some View {
		TabView {
			// First View
			//GroupBox(label: Text("Message:")) {TextEditor(text: $document.message)}
			ZStack {
				ARViewContainer(showed: $show).edgesIgnoringSafeArea(.all)
				
				VStack{
					// Header Bar
					headerView(show: $show, showModels: $showModels)
					// Spacer
					Spacer()

				} //Vstack
			}//Zstack
			.tabItem {Image(systemName: "camera.viewfinder")
					Text("Scan")}
			
			
			// Second View
			ZStack {
				ARViewContainer(showed: $show).edgesIgnoringSafeArea(.all)
				
				VStack{
					// Header Bar
					headerView(show: $show, showModels: $showModels)
					// Spacer
					Spacer()
					// Bottom Bar
					bottomView(showOptions: $showOptions)
				} //Vstack
			}//Zstack
				.tabItem {Image(systemName: "arkit")
					Text("View")}
			
			
			// Third View
			LibraryNavigationView(models: self.models)
			.tabItem {Image(systemName: "folder")
					Text("Library")}
		}.onAppear {
			// correct the transparency bug for Tab bars
		   let tabBarAppearance = UITabBarAppearance()
		   tabBarAppearance.configureWithOpaqueBackground()
		   UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
		   // correct the transparency bug for Navigation bars
		   let navigationBarAppearance = UINavigationBarAppearance()
		   navigationBarAppearance.configureWithOpaqueBackground()
		   UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
			}

	}// body
    }//struct

    
struct ARVariables{
	static var arView: ARView!
}


//**************************** ARview ****************************
struct ARViewContainer: UIViewRepresentable {
	@Binding var showed: Bool

	let anchor = AnchorEntity(plane: .horizontal, classification: .any)

    func makeUIView(context: Context) -> ARView {
		ARVariables.arView = ARView(frame: .zero)
		let entity = try! ModelEntity.loadModel(named: "cup")
		
		//2. Place Sphere
		ARVariables.arView.scene.addAnchor(anchor)
		anchor.addChild(entity)

		//3. Install moveing gestures
		entity.generateCollisionShapes(recursive: true)
		// .all means rotation and scale; .rotration means just it
		ARVariables.arView.installGestures([.translation, .all], for: entity)
		
		//4. Configure the plane
		let config = ARWorldTrackingConfiguration()
		config.planeDetection = [.horizontal, .vertical]
		config.environmentTexturing = .automatic
		
		if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
			config.sceneReconstruction = .mesh
		}
		
		ARVariables.arView.session.run(config)
		
		return ARVariables.arView
    }
    
	func updateUIView(_ uiView: ARView, context: Context) {
		if showed == true {
			uiView.scene.removeAnchor(anchor)
		}
	}
}

//************************************************************************
struct RemoveButton: View {
	@Binding var entities: [AnchorEntity]
	
	var body: some View {
		Button(action: removeEntity) {
			Text("Remove Entity")
		}
	}
	
	func removeEntity() {
		guard let entity = entities.last else { return }
		entities.removeLast()
		entity.removeFromParent()
	}
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
