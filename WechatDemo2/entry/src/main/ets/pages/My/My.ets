import {DiscoverRow} from '../Discover/Discover'

@Entry
@Component
export default struct My {
  build() {
    Navigation() {
      List({ space: 10 }) {
        ListItemGroup() {
          ListItem() {
            Flex({ direction: FlexDirection.Column }) {
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Flex({ direction: FlexDirection.Row }) {
                  Image('/images/ggbond.jpg')
                    .width(65)
                    .height(65)
                    .borderRadius(8)

                  Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center }) {
                    Text('八九不离十')
                      .fontSize(19)
                      .fontWeight(700)
                    Text('微信号：wipzhu')
                      .fontSize(17)
                      .fontColor(Color.Gray)
                      .margin({ top: 13 })
                  }
                  .height(65)
                  .margin({ left: 15 })
                  // .backgroundColor(Color.Blue)
                }
                // .backgroundColor(Color.Red)


                Image($r('app.media.arrow_right'))
                  .width(20)
                  .height(20)
              }
              // .backgroundColor(Color.Brown)

              Button('+ 状态')
                .fontColor(Color.Gray)
                .margin({ left: 80, top: 5 })
                .width(70)
                .height(30)
                .borderWidth(1)
                .borderColor('rgb(237,237,237)')
                .backgroundColor(Color.White)
            }
            .padding({ left: 15, right: 15 })
          }
        }
        .padding({ top: 10, bottom: 15 })
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r("app.media.my_icon_1"), titleStr: "服务" })
          }
        }
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.my_icon_2'), titleStr: '收藏' })
          }

          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.my_icon_3'), titleStr: '朋友圈' })
          }

          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.my_icon_4'), titleStr: '视频号' })
          }

          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.my_icon_5'), titleStr: '卡包' })
          }

          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.my_icon_6'), titleStr: '表情' })
          }
        }
        .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 0, endMargin: 0 }) // 每行之间的分界线
        .backgroundColor(Color.White)

        ListItemGroup() {
          ListItem() {
            DiscoverRow({ iconPath: $r('app.media.my_icon_7'), titleStr: '设置' })
          }
        }
        .backgroundColor(Color.White)

      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgb(237,237,237)')

    }
    // .title(this.navTitle())
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor(Color.White)

  }

  @Builder navTitle() {
    Row() {
      Text("My")
        .width('100')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

//
// @Component
// export struct DiscoverRow {
//   iconPath: Resource
//   titleStr: string
//
//   build() {
//     Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
//       Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
//         Image(this.iconPath)
//           .width(22)
//           .height(22)
//
//         Text(this.titleStr)
//           .fontSize(17)
//           .margin({ left: 10 })
//       }
//       .height(50)
//     }
//     .height(50)
//     .padding({ left: 12, right: 12 })
//   }
// }