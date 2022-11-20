//
//  CustomColorPicker.swift
//  SwiftUIImageColorPicker
//
//  Created by Kaori Persson on 2022-11-19.
//  Video https://www.youtube.com/watch?v=J9-4WM74p2Q

import SwiftUI

extension View {
  func imageColorPicker(showPicker: Binding<Bool>, color: Binding<Color>) -> some View {
    return self
      // full sheet
      .fullScreenCover(isPresented: showPicker, content: {
        
      })
  }
}

// MARK: -cutsom Color picker with the help of UIColor picker
struct CustomColorPicker: UIViewControllerRepresentable {
  
  // MARK: picker values
  @Binding var color: Color
  
  // This event is called before UIKit view is called, and execute the initialiser
  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    <#code#>
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    <#code#>
  }
  
  // MARK: - Delegate methods
  class Coordinator: NSObject, UIColorPickerViewControllerDelegate {
    
    // The subject of the management of UIkit view
    var parent: CustomColorPicker
    
    init(parent: CustomColorPicker) {
      self.parent = parent
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
      // Updating color
      parent.color = Color(viewController.selectedColor)
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
      parent.color = Color(color)
    }
  }
}
