import inputMethod from '@ohos.inputMethod'
import router from '@ohos.router'

@Entry
@Component
export default struct Chat {
  @State friendNickName: string = router.getParams()['friendNickName']
  @State friendAvatar: string = router.getParams()['friendAvatar']

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
      Image('/images/we_more.png')
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
            MessageRow({ message: '海燕啊，你可长点心吧~~~~~', friendAvatar: this.friendAvatar })
          }
          .backgroundColor(Color.Red)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 5, right: 30 })

          ListItem() {
            MessageRow({ message: '海燕啊，你可长点心吧！！！！', friendAvatar: this.friendAvatar })
          }
          .backgroundColor(Color.Green)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 5, right: 30 })

          ListItem() {
            MessageRowSelf({message:"我是燕子，我要走了，请你多保重", friendAvatar:'/images/ggbond.jpg'})
          }
          .backgroundColor(Color.Blue)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 5, right: 10 })


          ListItem() {
            MessageRow({ message: '燕子你走了我可怎么活啊燕子～～～～燕子～～～～啊啊～～～～～～～', friendAvatar: this.friendAvatar })
          }
          .backgroundColor(Color.Red)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 5, right: 30 })

          ListItem() {
            MessageRow({ message: '燕子你走了我可怎么活啊燕子～～～～燕子～～～～啊啊～～～～～～～', friendAvatar: this.friendAvatar })
          }
          .backgroundColor(Color.Blue)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 5, right: 30 })

          ListItem() {
            MessageRowSelf({message:"我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊", friendAvatar:'/images/ggbond.jpg'})
          }
          .backgroundColor(Color.Green)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 5, right: 10 })

          ListItem() {
            MessageRowSelf({message:"我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊", friendAvatar:'/images/ggbond.jpg'})
          }
          .backgroundColor(Color.Blue)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 5, right: 10 })

          ListItem() {
            MessageRowSelf({message:"我也不知道你该怎么活啊~~~~我也不知道你该怎么活啊", friendAvatar:'/images/ggbond.jpg'})
          }
          .backgroundColor(Color.Red)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 5, right: 10 })

          ListItem() {
            MessageRow({ message: '这次终于没问题了', friendAvatar: this.friendAvatar })
          }
          .backgroundColor(Color.Blue)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 5, right: 30 })

          ListItem() {
            MessageRow({ message: '哦吼，还是有问题', friendAvatar: this.friendAvatar })
          }
          .backgroundColor(Color.Green)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 10, top: 5, right: 30 })

          ListItem() {
            MessageRowSelf({message:"你想怎么活就怎么活吧", friendAvatar:'/images/ggbond.jpg'})
          }
          .backgroundColor(Color.Blue)
          .width('100%')
          .margin({ bottom: 5, top: 5 })
          .padding({ left: 30, top: 5, right: 10 })

        }
        .onScroll(() => {
          console.log("开始滑动2")
          inputMethod.getController().hideSoftKeyboard()
        })
        .onDragStart(() => {
          console.log("开始滑动")
          inputMethod.getController().hideSoftKeyboard()
        })
        // .alignListItem(ListItemAlign.End)
        .listDirection(Axis.Vertical)
        .backgroundColor('rgb(245,245,245)')
        .height('92%')
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

          Image('/images/emoji.png')
            .width(30)
            .height(30)
            .margin({ top: 5 })

          Image('/images/we_add.png')
            .width(30)
            .height(30)
            .margin({ top: 5 })
        }
        .backgroundColor('rgb(240,240,240)')
        // .backgroundColor(Color.Red)
        .padding({ top: 8, left: 12, right: 12 })
        .width('100%')
        .height('8%')

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
@Component
export struct MessageRow {
  message:string
  friendAvatar:string

  build() {

    Flex({ direction: FlexDirection.Row }) {
      Image(this.friendAvatar)
        .width(38)
        .height(38)
        .borderRadius(5)
        .margin({ right: 5, top: 5, bottom: 5 })
      Text(this.message)
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .padding(10)
        .borderRadius(6)
        .lineHeight(20)
        .margin({ left: 5, top: 5, bottom: 5 })
    }

  }
}
@Component
export struct MessageRowSelf {
  message:string
  friendAvatar:string

  build() {

    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.End }) {

      Text(this.message)
        .backgroundColor('rgb(63,182,57)')
        .fontColor(Color.Black)
        .padding(10)
        .borderRadius(6)
        .lineHeight(20)
        .margin({ right: 5, top: 5, bottom: 5 })

      Image(this.friendAvatar)
        .width(38)
        .height(38)
        .borderRadius(5)
        .margin({ left: 5, top: 5, bottom: 5 })
    }

  }
}