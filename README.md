PLZ USE YOUR FAVOURITE TEXT EDITOR TO VIEW THE README.md


An AR app that allows the inspector to visualize the fuselage and the inspection results in real-time, 
superimposing the 3D model onto the actual fuselage.

###################################### How to use and edit ######################################
                      !!!! Be aware this project only works on MacOS !!!!
1. Download the Xcode 
2. Download the whole project as zip file then upzip in your Mac
3. Open the project use the Xcode

4. You will find files listed on the left of your Xcode 
   There are three folders, open the "try2.7" and DO NOT modify other two foloders!

5. Then you can Edit the project. 

REMEMBER to talked to Ray when you finish you part, and let him to integrated all together.
Make sure to mark out the part you modified like below, including your intial and date: 
//************************ Modified RC 04/12/23 (Start) ************************
Struct sample: View{
    @Binding var show: Bool
    @Binding var showModels: Bool
}
//************************ Modified RC 04/12/23 (End) ************************

6. To try and run the App, you must have an iOS device that have lidar and the system version
   is later than iOS 16.2.
   6.1 Connect your iOS device with your Mac, then approve the connection in your iOS device.
       Make your iOS device to be the delevoper mode.
   6.2 Click the Run button at right of your left side bar, it should work.
       (You can select the device at the grey bar like search bar)
   6.3 If can not install on you device, click the projct name on the left side bar, then in the
       main page find "Signing and Capabilities" to modify "Team" and "Bundle Identifier".

######################################## file description ########################################
.
"AppDelegate.swift"
      DO NOT Modify. Used to test, print out the error messages and run the UI.

"MessageDocument.swift"
      DO NOT Modify. Used to test, print out the error messages and run the UI.
      
"ContentView.swift"
      Control the UI/UX of the mian screen.

"Buttons" Folder 
      Folder that stores edited and ready to usee buttons for furture developments.
        "Button.swift"
            Edited and ready to usee buttons for furture developments.
        "按键们.swift"
            Edited and ready to usee buttons for furture developments.
          
"ARview" Folder
      Folder that Control ARview, the Second tab in the "ContentView.swift"
         "HeaderandBottomView.swift"
             Used to control the function (2) and (3) of the app.
         
"LibraryView" Folder
      Folder that Control LibraryView, the Third tab in the "ContentView.swift"
          "LibraryNavigationView.swift"
             Used to control the Function (4) of the app.
          "ScorellViewOfContent.swift"
             Used to control the File broswer of the Function (4).
           
"Models" Folder
      Stored all 3D models in the app.
  
"Assets" Folder
      Stored all the image that may used in the app.

"Preview Content" Folder
      DO NOT Modify. Used to test, print out the error messages and run the UI.

#################################### functions specification ####################################
The AR app has following functions: (ALL IN PROGESS)

(1). Scan the object and then export it as a 3D model. 
    1.1 Make the software can Scan the object. 
    1.2 Export it as a 3D model. 
    1.3 Convert file type (USDZ). 
    
(2). Anchor that 3D models at a specific location in the real world. 
    2.1 Make the software can anchor 3D models in real world. 
    2.2 Reference point for anchoring the object. 
    2.3 Calibrate to higher precision.

(3). Mark spots outside and located those inside.
    3.1 Research an algorithm for precise spot location.
    3.2 Mark the precise spot.
    3.3 Draw a line that is perpendicular to the panel.
    
(4). Build a files management system 
    4.1 Files' names can be edited and files can be deleted and previewed. 
    4.2 Files can be imported from outside and exported to other platforms. 
    4.3 Files can be sorted into different folders for better management.

#################################### others ####################################
