import router from '@ohos.router'

@Component
export struct Header {
  @State params: any = router.getParams()

  build() {
    // 标题部分
    Row({ space: 10 }) {
      Image($r('app.media.ic_public_back'))
        .width(30)
        .onClick(() => {
          // 返回前的警告
          /* router.showAlertBeforeBackPage({
             message: '支付还未完成，确定要返回吗？'
           })*/

          // 返回上一页
          router.back()
        })
      if (this.params) {
        Text(this.params.id + '.' + this.params.title)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
      }
      Blank()
      Image($r('app.media.ic_public_refresh'))
        .width(30)
    }
    .padding({ top: 15, bottom: 15 })
    .width('98%')
    .height(60)

  }
}