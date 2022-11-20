//
//  CustomColorPicker.swift
//  SwiftUIImageColorPicker
//
//  Created by Kaori Persson on 2022-11-19.
//  Video https://www.youtube.com/watch?v=J9-4WM74p2Q

import SwiftUI

extension View {
  
  // Create a swiftui modifier, this method is called for modifier, see homeview
  func imageColorPicker(showPicker: Binding<Bool>, color: Binding<Color>) -> some View {
    return self
      // full sheet
      .fullScreenCover(isPresented: showPicker, content: {
        Helper(showPicker: showPicker, color: color)
      })
  }
}

// MARK: - Custom View for color picker
struct Helper: View {
  @Binding var showPicker: Bool
  @Binding var color: Color
  
  var body: some View {
    NavigationView {
      CustomColorPicker(color: $color)
        .navigationTitle("Image Color Picker")
        .navigationBarTitleDisplayMode(.inline)
      // MARK: - close button
        .toolbar {
          Button("Close") {
            showPicker.toggle()
          }
        }
    }
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
    
    let picker = UIColorPickerViewController()
    picker.supportsAlpha = false
    picker.selectedColor = UIColor(color)
    
    // connecting delegate
    picker.delegate = context.coordinator
    
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

  }
  
  // MARK: - Delegate methods
  class Coordinator: NSObject, UIColorPickerViewControllerDelegate {
    
    // The management subject of UIkit view
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
