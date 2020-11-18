// ASCollectionView. Created by Apptek Studios 2019

import SwiftUI

struct RowItem: View
{
  var model: Item
  var item: String { model.name }
//  var title: String
  
  var showChevron: Bool = true
  
  var body: some View
  {
    HStack(alignment: .center)
    {
      Image(systemName: model.icon ?? "house")
        .font(.system(size: (18), weight: Font.Weight.regular))
        .padding(10)
        .foregroundColor(.black)
        .background(
          Circle().fill(Color.white)
        )
      
      Text(model.name)
        .multilineTextAlignment(.leading)
        .foregroundColor(Color(.label))
      
      Spacer()
      
//      model.itemCount.map
//      {
////        Text("\($0)")
//      }
      if showChevron {
        Image(systemName: "chevron.right")
          .font(.system(size: 18))
          .padding(10)
      }
    }
    .background(Color(.secondarySystemGroupedBackground))
    .padding(10)
    .onDisappear() {
      print("disappearing item", model.name)
    }.onAppear() {
      print("appearing item", model.name)
    }
  }
  
}

struct RowItem_Previews: PreviewProvider
{
  static var previews: some View
  {
    RowItem(model: .demo)
  }
}
