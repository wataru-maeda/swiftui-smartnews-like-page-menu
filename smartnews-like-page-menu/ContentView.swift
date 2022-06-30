//
//  ContentView.swift
//  smartnews-like-page-menu
//
//  Created by Wataru Maeda on 2022/06/29.
//

import SwiftUI

struct ContentView: View {
  @State private var selection = 0
  let items = [
    PageMenuItem(
      title: "Page 0",
      color: .purple,
      content: Text("Page 0")
    ),
    PageMenuItem(
      title: "Page 1",
      color: .red,
      content: Text("Page 1")
    ),
    PageMenuItem(
      title: "Page 2",
      color: .pink,
      content: Text("Page 2")
    ),
    PageMenuItem(
      title: "Page 3",
      color: .orange,
      content: Text("Page 3")
    ),
    PageMenuItem(
      title: "Page 4",
      color: .blue,
      content: Text("Page 4")
    ),
    PageMenuItem(
      title: "Page 5",
      color: .green,
      content: Text("Page 5")
    )
  ]

  var body: some View {
    PageMenu(selecton: $selection, items: items)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
