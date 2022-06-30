# swiftui-smartnews-like-page-menu

## Demo

<img src="https://github.com/wataru-maeda/swiftui-smartnews-like-page-menu/blob/main/demo.gif" width="280">

## Installation

Drag & Drop [PageMenu](https://github.com/wataru-maeda/swiftui-smartnews-like-page-menu/tree/main/smartnews-like-page-menu/PageMenu) folder into your project

## Usage

```
struct ContentView: View {
  @State private var selection = 0
  let items = [
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
    )
  ]

  var body: some View {
    PageMenu(selecton: $selection, items: items)
  }
}


```
