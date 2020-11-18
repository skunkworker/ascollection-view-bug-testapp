//
//  EditSheet.swift
//

import SwiftUI
import UIKit
import iTextField

struct EditSheet: View
{
  @State private var isEditing: Bool = true
  @State private var name: String = ""

  var dismiss: () -> Void
  init(dismiss: @escaping () -> Void) {
    self.dismiss = dismiss
  }
  
  func save() {
    print("saved")
    self.isEditing = false
    self.dismiss()
  }
  
  func exitWithoutSaving() {
    print("exitWithoutSaving")
    self.isEditing = false
    self.dismiss()
  }
  
  var body: some View
  {
    HStack(alignment: .bottom){
      Button("Close"){
        exitWithoutSaving()
      }.frame(maxWidth: .infinity, alignment: .leading)
      Text("Add").frame(maxWidth: .infinity).font(.headline)
      Button("Save") {
        save()
      }.frame(maxWidth: .infinity, alignment: .trailing)
    }
    .padding(20)
    ScrollView {
      VStack(alignment: .center)
      {
        iTextField("Some Text", text: $name, isEditing: $isEditing)
          .accentColor(.purple)
          .fontFromUIFont(UIFont(name: "Avenir", size: 24))
          .keyboardType(.URL)
          .returnKeyType(.done)
          .disableAutocorrection(true)
          .autocapitalization(.none)
          .padding()
        
        Spacer()
        
        Button(action: {
          print("clicked save")
          save()
        }) {
          Text("Save")
        }
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        
      }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
    .onAppear {
    }
    .onDisappear() {
      self.isEditing = false
    }
  }
}

// wrap the view in another one in order to pass a faux state
// https://developer.apple.com/forums/thread/118589
struct EditSheetBindingPreview: View {
  @State var present = false
  var body: some View {
    EditSheet(dismiss: {})
  }
}

struct EditSheet_Previews: PreviewProvider {
  static var previews: some View {
    EditSheetBindingPreview()
  }
}
