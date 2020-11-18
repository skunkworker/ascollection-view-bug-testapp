// ASCollectionView. Created by Apptek Studios 2019

import Foundation
import SwiftUI


struct Item: Identifiable
{
  var icon: String?
  var name: String
  var id: String { name }
  var itemCount: Int? = Int.random(in: 0 ... 20)
  
  static var demo = Item(icon: "paperplane", name: "Test category", itemCount: 19)
}
