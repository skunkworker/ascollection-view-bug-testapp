//
//  ContentView.swift
//  TestApp
//
//  Created by John Bolliger on 10/3/20.
//

import SwiftUI
import ASCollectionView

struct ContentView: View {
    @State var dataExample = (0 ..< 200).map { $0 }
    @State var presentingModal = false

    var body: some View {
      HStack() {
        Button(action: {
          print("clicked button to show sheet")
          self.presentingModal = true
        }) {
          Image(systemName: "plus.circle.fill")
            .font(.system(size: 24))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            .foregroundColor(.primary)
        }
      }
//      remove below NavigationView to remove the bug.
      NavigationView
      {
        ASCollectionView(data: dataExample, dataID: \.self) { item, _ in
          RowItem(model: Item(name: "\(item)"))
        }
        .layout {
          .grid(layoutMode: .adaptive(withMinItemSize: 330),
                itemSpacing: 20,
                lineSpacing: 20,
                itemSize: .estimated(90))
        }
        .alwaysBounceVertical()
        .navigationTitle("Foobar")
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $presentingModal) {
          EditSheet(dismiss: {
            print("dismissed")
            self.presentingModal = false
          })
        }
      }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
