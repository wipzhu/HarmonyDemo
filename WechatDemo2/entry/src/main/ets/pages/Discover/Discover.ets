@Entry
@Component
export default struct Discover {
  build() {

    Navigation() {
      List({ space: 10 }) {
        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r("app.media.discover_icon_1"), titleStr: "朋友圈" })
          }
        }
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_2'), titleStr: "视频号" })
          }
        }
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_3'), titleStr: '扫一扫' })
          }
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_4'), titleStr: '摇一摇' })
          }
        }
        .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 60, endMargin: 0 }) // 每行之间的分界线
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_5'), titleStr: '看一看' })
          }

          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_6'), titleStr: '搜一搜' })
          }
        }
        .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 60, endMargin: 0 }) // 每行之间的分界线
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_7'), titleStr: '游戏' })
          }
        }
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.discover_icon_8'), titleStr: '小程序' })
          }
        }
        .backgroundColor(Color.White)

      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgb(237,237,237)')

    }
    .title(this.navTitle())
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .size({ width: '100%', height: '100%' })
    .backgroundColor('rgb(237,237,237)')

  }


  @Builder navTitle() {
    Row(){
      Text("Discover")
        .width('100')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}



@Component
export struct DiscoverRow {
  iconPath: Resource
  titleStr: string

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Image(this.iconPath)
          .width(28)
          .height(28)

        Text(this.titleStr)
          .fontSize(17)
          .margin({ left: 10 })
      }
      .height(55)

      Image($r('app.media.arrow_right'))
        .width(20)
        .height(20)
    }
    .height(55)
    .padding({ left: 12, right: 12 })
  }
}