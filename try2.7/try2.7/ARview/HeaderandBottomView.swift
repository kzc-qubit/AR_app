//
//  HeaderandBottomView.swift
//  try2.7
//
//  Created by Ray Chen on 2/18/23.
//

import Foundation
import SwiftUI

struct xxx: View {
    
    var body: some View {
        
        Text("Example")
        
        
    }//var body: some View
}



//************************************************************************
struct headerView: View{
    @Binding var show: Bool
    @Binding var showModels: Bool
    
    var body: some View{
        HStack{
            // Reset
            Button {self.show.toggle()} label: {
                Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                    .padding(8)
                  .background(Color.white.opacity(0.75))
                  .cornerRadius(8)
            }
             
            Spacer()
            
            // Save
            Button {
                self.showModels.toggle()
            } label: {
                Label("Save", systemImage: "arrow.down.to.line.compact")
                    .padding(8)
                  .background(Color.white.opacity(0.75))
                  .cornerRadius(8)
            }
            
            
        }
        .padding()
    }
}

//************************************************************************
struct bottomView: View{
    @Binding var showOptions: Bool
    
    var body: some View{
        
        HStack(spacing: 5){
            // mark the location
            Button {
                print("DEBUG: Options")
                showOptions.toggle()
            } label: {
                Image(systemName: "plus")
            }    .frame(width:50, height:50)
                .font(.title)
                    .foregroundColor(.white)
                   .background(.orange.opacity(0.65))
                   .cornerRadius(30)
                   .padding()
                
            
            if showOptions {
                // button to take screen shot
                Button {
                    // Placeholder: take a snapshot
                    ARVariables.arView.snapshot(saveToHDR: false) { (image) in
                        // Compress the image
                        let compressedImage = UIImage(
                            data: (image?.pngData())!)
                        // Save in the photo album
                        UIImageWriteToSavedPhotosAlbum(
                            compressedImage!, nil, nil, nil)
                    }
                    
                } label: {
                    Image(systemName: "camera")
                        .frame(width:50, height:50)
                        .font(.title)
                        .background(.white.opacity(0.75))
                        .cornerRadius(30)
                        .padding()
                }
                // Erase the locater
                Button {
                    print("DEBUG: Locate")
                } label: {
                    Image(systemName: "eraser")
                }   .frame(width:50, height:50)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding()
                // Mark the location
                Button {
                    print("DEBUG: Locate")
                } label: {
                    Image(systemName: "pencil.and.outline")
                }   .frame(width:50, height:50)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding()

            }
            Spacer()
        }
        
    }
}
