import router from '@ohos.router'

@Component
struct SecondPage {
  @State message: string = 'Hello World'
  @State textMsg: string = router.getParams()?.['textMsg']

  build() {
    Row() {
      Column() {
        Text(this.textMsg)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Blank()

        Button('Back')
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}