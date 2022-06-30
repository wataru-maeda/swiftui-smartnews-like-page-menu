//
//  PageMenu.swift
//  smartnews-like-page-menu
//
//  Created by Wataru Maeda on 2022/06/29.
//

import SwiftUI

struct PageMenuItem {
  var title: String
  var color: Color
  var content: AnyView
  
  init<Content: View>(title: String, color: Color, content: Content) {
    self.title = title
    self.color = color
    self.content = AnyView(content)
  }
}

struct PageMenu: View {
  @Binding var selection: Int
  var items: [PageMenuItem]
  
  init (selecton: Binding<Int>, items: [PageMenuItem]) {
    self._selection = selecton
    self.items = items
  }
  
  var body: some View {
    VStack(spacing: 0) {
      ScrollViewReader { proxy in

        // MARK: - PAGE MENU
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .bottom, spacing: 0) {
            ForEach(0..<items.count, id: \.self) { i in
              PageMenuTab(
                title: items[i].title,
                background: items[i].color,
                active: i == selection) {
                  selection = i
                  withAnimation {
                    proxy.scrollTo(i)
                  }
                }
                .id(i)
            }
          }
        }
        
        // MARK: - TAB VIEW
        
        TabView(selection: $selection) {
          ForEach(0..<items.count, id: \.self) {
            items[$0].content.tag($0)
          }
        }
        .onChange(of: selection) { i in
          withAnimation {
            proxy.scrollTo(i)
          }
        }
        .tabViewStyle(.page)
        .menuIndicator(.hidden)
        .animation(.easeOut(duration: 0.2), value: selection)
      }
    }
  }
}

struct PageMenu_Previews: PreviewProvider {
  @State static var selection = 0
  static var items = [
    PageMenuItem(title: "Test 0", color: .purple, content: Text("test 0")),
    PageMenuItem(title: "Test 1", color: .red, content: Text("test 1")),
    PageMenuItem(title: "Test 2", color: .pink, content: Text("test 2"))
  ]
  static var previews: some View {
    PageMenu(selecton: $selection, items: items)
  }
}
