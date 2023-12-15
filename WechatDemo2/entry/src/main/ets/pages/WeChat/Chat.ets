import inputMethod from '@ohos.inputMethod'

@Entry
@Component
export default struct Chat {
  @State friendNickName: string = "猪头"

  @Builder NavTitle() {
    Row() {
      Text(this.friendNickName)
        .width('100')
    }
    .width('80%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder NavMenus() {
    Row() {
      Image('/images/we_add.png')
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
    }
    .justifyContent(FlexAlign.End)
  }

  build() {
    Column() {
      Navigation() {
        List() {
          ListItem() {
            Flex({ direction: FlexDirection.Row }) {
              Image('/images/icon1.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ right: 5, top: 5, bottom: 5 })
              Text('海燕啊，你可长点心吧！！！！')
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ left: 5, top: 5, bottom: 5 })
            }
          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 10, bottom: 1, right: 30 })

          ListItem() {
            Flex({ direction: FlexDirection.Row }) {
              Image('/images/icon1.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ right: 5, top: 5, bottom: 5 })
              Text('海燕啊，你可长点心吧！！！！')
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ left: 5, top: 5, bottom: 5 })
            }
          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 10, bottom: 1, right: 30 })


          ListItem() {
            Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.End }) {

              Text('我是燕子，我要走了，请你多保重')
                .backgroundColor('rgb(63,182,57)')
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ right: 5, top: 5, bottom: 5 })

              Image('/images/icon2.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ left: 5, top: 5, bottom: 5 })
            }

          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 10, bottom: 1, right: 10 })


          ListItem() {
            Flex({ direction: FlexDirection.Row }) {
              Image('/images/icon1.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ right: 5, top: 5, bottom: 5 })
              Text('燕子你走了我可怎么活啊燕子～～～～燕子～～～～啊啊～～～～～～～')
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ left: 5, top: 5, bottom: 5 })
            }
          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 10, bottom: 1, right: 30 })


          ListItem() {
            Flex({ direction: FlexDirection.Row }) {
              Image('/images/icon1.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ right: 5, top: 5, bottom: 5 })
              Text('燕子你走了我可怎么活啊燕子～～～～燕子～～～～啊啊～～～～～～～')
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ left: 5, top: 5, bottom: 5 })
            }
          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 10, bottom: 1, right: 30 })

          ListItem() {
            Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.End }) {

              Text('我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~')
                .backgroundColor('rgb(63,182,57)')
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ right: 5, top: 5, bottom: 5 })

              Image('/images/icon2.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ left: 5, top: 5, bottom: 5 })
            }

          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 10, bottom: 1, right: 10 })


          ListItem() {
            Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.End }) {

              Text('我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊~~~~')
                .backgroundColor('rgb(63,182,57)')
                .fontColor(Color.Black)
                .padding(10)
                .borderRadius(6)
                .lineHeight(20)
                .margin({ right: 5, top: 5, bottom: 5 })

              Image('/images/icon2.png')
                .width(38)
                .height(38)
                .borderRadius(5)
                .margin({ left: 5, top: 5, bottom: 5 })
            }

          }
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 10, bottom: 1, right: 10 })

        }
        .onScroll(() => {
          console.log("开始滑动2")
          inputMethod.getController().hideSoftKeyboard()
        })
        .onDragStart(() => {
          console.log("开始滑动")
          inputMethod.getController().hideSoftKeyboard()
        })
        .listDirection(Axis.Vertical)
        .backgroundColor('rgb(245,245,245)')
        .height('90%')
        .width('100%')


        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          Image('/images/voice.png')
            .width(30)
            .height(30)
            .margin({ top: 5 })

          TextInput()
            .width('62%')
            .height(40)
            .backgroundColor(Color.White)
            .borderRadius(5)

          Image('/images/emoj.png')
            .width(30)
            .height(30)
            .margin({ top: 5 })

          Image('/images/we_add.png')
            .width(30)
            .height(30)
            .margin({ top: 5 })
        }
        .padding({ top: 10, left: 15, right: 15 })
        .width('100%')
        .height(60)
        .backgroundColor('rgb(240,240,240)')

      }
      .title(this.NavTitle())
      .mode(NavigationMode.Stack)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(false)
      .menus(this.NavMenus())
      .size({ width: '100%', height: '100%' })
      .backgroundColor('rgb(237,237,237)')
    }
  }
}