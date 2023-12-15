import router from '@ohos.router'

// @Entry
@Component
export default struct Home {
  @State navTitle: string = 'WeChat'
  @State menuOpacity: number = 0

  onPageHide() {
    this.menuOpacity = 0
  }

  @Builder NavTitle() {
    Row() {
      Text(this.navTitle)
        .width('100')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder NavMenus() {
    Row() {
      Image('/images/we_add.png')
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
        .onClick(() => {
          animateTo({
            duration: 240,
          }, () => {
            if (this.menuOpacity == 0) {
              this.menuOpacity = 1
            } else if (this.menuOpacity == 1) {
              this.menuOpacity = 0
            }
          })
        })
    }.justifyContent(FlexAlign.End)
  }

  build() {
    Column() {
      Navigation() {
        Stack({ alignContent: Alignment.TopEnd }) {
          Column() {
            TextInput({ placeholder: 'tap to search' })
              .width('92%')
              .height(40)
              .backgroundColor(Color.White)
              .margin(5)
              .borderRadius(5)
              .textAlign(TextAlign.Start)

            List() {
              ListItem() {
                MessageRow({
                  imagePath: '/images/icon1.png',
                  nickName: '猪头',
                  msgContent: '燕子你走了我可怎么活啊燕子～～～～燕子～～～～',
                  msgTime: '13:14'
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/WeChat/Chat' ,
                  params: {
                    friendNickName:"老张"
                  }})
              })

              ListItem() {
                MessageRow({
                  imagePath: '/images/icon2.png',
                  nickName: '老张',
                  msgContent: '欢迎关注幽蓝计划公众号',
                  msgTime: '12:13'
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/WeChat/Chat' ,
                  params: {
                    friendNickName:"老张"
                  }})

              })

              ListItem() {
                MessageRow({
                  imagePath: '/images/icon3.png',
                  nickName: '王富贵',
                  msgContent: '你猜这是为什么',
                  msgTime: '12:13'
                })
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/WeChat/Chat',
                  params: {
                    friendNickName:"老张"
                  }})
              })

            }
            .width('100%')
            .height('100%')
            .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 6, endMargin: 0 }) // 每行之间的分界线
            .margin({ top: 10 })
            .padding({ left: 17, right: 17 })
            .backgroundColor(Color.White)
          }

          // 右上角+号
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center }) {
            Path()
              // .backgroundColor(Color.Green)
              .width(20)
              .height(20)
              .commands('M25 0 L50 50 L0 50 Z')
              .fill('rgb(76,76,76)')
              .stroke('rgb(76,76,76)')
              .padding(0)
              .margin(0)
              .position({ x: 95, y: 0 })

            List() {
              ListItem() {
                MenuRow({ imagePath: '/images/menu_group.png', titleStr: '发起群聊' })
              }

              ListItem() {
                MenuRow({ imagePath: '/images/menu_add.png', titleStr: '添加朋友' })
              }

              ListItem() {
                MenuRow({ imagePath: '/images/menu_scan.png', titleStr: '扫一扫' })
              }

              ListItem() {
                MenuRow({ imagePath: '/images/menu_purchase.png', titleStr: '收付款' })
              }
            }
            .margin(0)
            .borderRadius(5)
            .padding({ left: 12 })
            .divider({ strokeWidth: 1, color: 'rgb(130,130,130)', startMargin: 20, endMargin: 0 }) // 每行之间的分界线
            .backgroundColor('rgb(76,76,76)')
            .width(130)
            .height(180)
          }
          .opacity(this.menuOpacity)
          .width(130)
          .height(200)
          .margin({ right: 10, top: -10 })

        }
        // .backgroundColor(Color.Blue)
      }
      .title(this.NavTitle())
      .mode(NavigationMode.Stack)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
      .menus(this.NavMenus())
      .size({ width: '100%', height: '100%' })
      .backgroundColor('rgb(237,237,237)')
      // .backgroundColor('#ffddf6d6')
    }
    .width('100%')
    .height('100%')
    // .padding(10)
    // .backgroundColor(Color.Red)

  }
}

@Component
struct MessageRow {
  imagePath: string
  nickName: string
  msgContent: string
  msgTime: string

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Image(this.imagePath)
        .width(60)
        .height(60)
        .borderRadius(5)

      Flex({ direction: FlexDirection.Column }) {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          Text(this.nickName)
            .fontColor('rgb(15,15,15)')
            .fontSize(20)

          Text(this.msgTime)
            .fontColor('rgb(210,210,210)')
            .fontSize(13)
        }

        Text(this.msgContent)
          .fontColor('rgb(190,190,190)')
          .fontSize(17)
          .margin({ top: 10 })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)

      }
      .height(55)
      .margin({ left: 10 })
    }
    .height(80)
    // .backgroundColor(Color.Green)
    // .width('100%')

  }
}


@Component
struct MenuRow {
  imagePath: string
  titleStr: string

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Image(this.imagePath)
        .width(21)
        .height(21)

      Text(this.titleStr)
        .fontColor(Color.White)
        .fontSize(18)
        .margin({ left: 8 })
    }
    .height(45)

  }
}
