//
//  Buttons.swift
//  try2.7
//
//  Created by Ray Chen on 2/18/23.
//

import Foundation
import SwiftUI


//************************************************************************
// better way to locate the confrim and cancle button
struct PlacementButtonsView: View{
    @Binding var isPlacementEnabled: Bool

    var body: some View{
 // cancel button
 Button(action: {
     print("DEBUG: cancle")
     self.resetPlacement()
 }){
     Image(systemName: "xmark")
         .frame(width: 60, height: 60)
         .font(.title)
         .background(Color.red.opacity(0.75))
         .cornerRadius(30)
         .padding(20)
 }
 // confrim button
 Button(action: {
     print("DEBUG: confrim")
     self.resetPlacement()
 }){
     Image(systemName: "checkmark")
         .frame(width: 60, height: 60)
         .font(.title)
         .background(Color.green.opacity(0.75))
         .cornerRadius(30)
         .padding(20)
 }
    }
    func resetPlacement(){
        self.isPlacementEnabled = false
    }
}




