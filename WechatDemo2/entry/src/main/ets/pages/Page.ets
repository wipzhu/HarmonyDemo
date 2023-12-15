@Entry
@Component
struct Page {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Search({placeholder: "请输入搜索内容"})
          .width("100%")
          .height("40vp")
          .borderStyle(BorderStyle.Dotted)
          .borderRadius("20vp")
          .placeholderFont({ size: "15vp" })
          .placeholderColor("#a6a6a6")
        Refresh({ friction: 62, offset: "16vp", refreshing: true })
          .width("100%")
          .height("100vp")
        Progress({ value: 0 })
          .width("100%")
          .height("40vp")
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}