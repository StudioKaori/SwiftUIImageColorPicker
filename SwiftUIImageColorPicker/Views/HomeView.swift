//
//  HomeView.swift
//  SwiftUIImageColorPicker
//
//  Created by Kaori Persson on 2022-11-19.
//

import SwiftUI

struct HomeView: View {
  
  // MARK: - image color picker value
  @State private var showPicker: Bool = false
  @State private var selectedColor: Color = .white
  
    var body: some View {
      ZStack {
        
        Rectangle()
          .fill(selectedColor)
          .ignoresSafeArea()
        
        // MARK: - picker button
        Button {
          showPicker.toggle()
        } label: {
          Text("Show Image Color Picker")
        }
      }
      // MARK: - Calling modifier
      .imageColorPicker(showPicker: $showPicker, color: $selectedColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
