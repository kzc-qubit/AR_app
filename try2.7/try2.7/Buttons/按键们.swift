import Foundation
import SwiftUI


//GroupBox(label: Text("Message:")) {TextEditor(text: $document.message)}





//        ScrollView(.vertical, showsIndicators: true){
//                    VStack(spacing: 20){
//                        Button {
//                            print("DEBUG: library")
//                        } label: {
//                            Image(systemName: "1.circle")
//                        }
//
//                        Button {
//                            print("DEBUG: library")
//                        } label: {
//                            Image(systemName: "2.circle")
//                        }
//
//                    }
//        }





//if self.isPlacementEnabled{
//    PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled)
//}
//else{}






//                    HStack {
//                                ProgressView(value: progress){
//                                    Text("Ratio:\(Int(progress*100))%")
//                                }
//                                Button(action: { self.show.toggle() }) {
//                                        Text("Remove Model")
//                                }
//                                Menu{
//                                    Button(action: {print("DEBUG: export")
//                                        isExporting = true}) {
//                                            Label("Export", systemImage: "square.and.arrow.up").font(.title)
//                                    }
//                                    Button(action: {print("DEBUG: import")
//                                        isImporting = true}) {
//                                        Label("Import", systemImage: "square.and.arrow.down").font(.title)
//                                    }
//                                }label: {
//                                    Image(systemName: "ellipsis")
//                                }
//
//                                HStack(spacing: 20){
//                                    Button {
//                                        print("DEBUG: Options")
//                                        showOptions.toggle()
//                                    } label: {
//                                        Image(systemName: "plus.circle.fill")
//                                    }    .frame(width: 40, height: 40)
//                                        .font(.largeTitle)
//
//                                    //if showOptions {
//                                        Button {
//                                            print("DEBUG: Locate")
//                                        } label: {
//                                            Image(systemName: "eraser")
//                                        }    .frame(width: 40, height: 40)
//                                            .font(.title)
//                                        Button {
//                                            print("DEBUG: Locate")
//                                        } label: {
//                                            Image(systemName: "pencil.and.outline")
//                                        }    .frame(width: 40, height: 40)
//                                            .font(.title)
//                                    //}
//                                }
                        










//**************************** EXPORT ****************************
//        .fileExporter(
//            isPresented: $isExporting,
//            document: document,
//            contentType: .plainText,
//            defaultFilename: "Message"
//        ) { result in
//            if case .success = result {
//                // Handle success.
//            } else {
//                // Handle failure.
//            }
//        }
////**************************** IMPORT ****************************
//        .fileImporter(
//            isPresented: $isImporting,
//            allowedContentTypes: [.plainText],
//            allowsMultipleSelection: false
//        ) { result in
//            do {
//                guard let selectedFile: URL = try result.get().first else { return }
//                guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
//
//                document.message = message
//            } catch {
//                // Handle failure.
//            }
//        }
//
//                if self.isPlacementEnabled{
//                    PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled)
//                }
//                else{}




/*
 func creatBox() -> ModelEntity{
     let box = MeshResource.generateBox(size: 0.5)
     let boxMaterial = SimpleMaterial(color: .systemGreen, roughness: 0, isMetallic: true)
     let boxEntity = ModelEntity(mesh: box, materials:  [boxMaterial])
     return boxEntity
         }
 
 func placeBox(box:ModelEntity){
     // crate anchor
     let boxAnchor = AnchorEntity(plane: .any)
     boxAnchor.addChild(box)
     
     // add the anchor to the scene
     arView.scene.addAnchor(boxAnchor)
 }
 
 func installGestures(on object: ModelEntity){
     object.generateCollisionShapes(recursive: true)
     //arView.installGestures([.rotation, .scale], for: object)
     arView.installGestures(.all, for: object)
 }
 */
