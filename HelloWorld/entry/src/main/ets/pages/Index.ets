import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)

        Blank()
        Button('Next')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/SecondPage',
              params: {
                textMsg:"你好，世界！"
              }
            })
          })
      }
      .width('100%')

    }
    .height('100%')
  }
}