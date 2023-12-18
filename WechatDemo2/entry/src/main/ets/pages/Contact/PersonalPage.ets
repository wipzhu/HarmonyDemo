import router from '@ohos.router'

@Entry
@Component
struct PersonalPage {
  @State person: object = router.getParams()['person']

  build() {
    Column() {
      Navigation() {
        List({ space: 10 }) {

          ListItemGroup() {
            ListItem() {
              Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                Image(this.person['avtar'])
                  .width(65)
                  .height(65)
                  .borderRadius(8)

                Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween }) {
                  Flex({ direction: FlexDirection.Row }) {
                    Text(this.person['name'])
                      .fontSize(22)
                    Image($r('app.media.info_logo'))
                      .width(20)
                      .height(20)

                  }

                  Column() {
                    Text('昵称：你是我的小苹果')
                      .width('80%')
                      .textAlign(TextAlign.Start)
                      .fontColor(Color.Gray)
                      .fontSize(15)
                      .margin({ bottom: 3 })
                    Text('微信号：' + this.person['wx_id'])
                      .width('80%')
                      .textAlign(TextAlign.Start)
                      .fontColor(Color.Gray)
                      .fontSize(15)
                      .margin({ bottom: 3 })
                    Text('地区：中国大陆')
                      .width('80%')
                      .textAlign(TextAlign.Start)
                      .fontColor(Color.Gray)
                      .fontSize(15)
                      .margin({ bottom: 3 })
                  }
                }
                .margin({ left: 15 })
              }
              .padding({ bottom: 30, top: 10 })
            }

            ListItem() {
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {

                  Text('电话号码')
                    .fontSize(18)
                    .width('80vp')
                    .margin({right:20})

                  Text('18272891085')
                    .fontColor('#566c95')
                    .fontWeight(FontWeight.Bold)
                    .textAlign(TextAlign.Start)
                }
              }
              .height(45)
            }

            ListItem() {
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {

                  Text('标签')
                    .fontSize(18)
                    .width('80vp')
                    .margin({right:20})

                  Text('狂奔。大小花')
                    .textAlign(TextAlign.Start)
                }

                Image($r('app.media.arrow_right'))
                  .width(20)
                  .height(20)
              }
              .height(45)
            }

            ListItem() {
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {

                  Text('朋友权限')
                    .fontSize(18)
                    .width('80vp')
                    .margin({right:20})

                  Text('所有可见')
                    .textAlign(TextAlign.Start)
                }

                Image($r('app.media.arrow_right'))
                  .width(20)
                  .height(20)
              }
              .height(45)

            }
          }
          .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 0, endMargin: 0 }) // 每行之间的分界线
          .padding({ left: 12, right: 12, top: 20 })
          .backgroundColor(Color.White)

          ListItemGroup() {
            ListItem() {
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {

                Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                  Text('朋友圈')
                    .fontSize(18)
                    .width(100)
                  // $r("app.media.arrow_right_filled")

                  Image('/images/icon1.png')
                    .width(50)
                    .height(50)

                }
                .height(70)

                Image($r('app.media.arrow_right'))
                  .width(20)
                  .height(20)
              }
              .height(70)
            }

            ListItem() {
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Text('更多信息')
                  .fontSize(18)
                // $r("app.media.arrow_right_filled")

                Image($r('app.media.arrow_right'))
                  .width(20)
                  .height(20)
              }
              .height(45)

            }
          }
          .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 0, endMargin: 0 }) // 每行之间的分界线
          .padding({ left: 12, right: 12, top: 0 })
          .backgroundColor(Color.White)

          ListItemGroup() {
            ListItem() {
              Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
                Image($r('app.media.person_message'))
                  .width(25)
                  .height(25)

                Text('发消息')
                  .fontSize(19)
                  .fontWeight(700)
                  .fontColor('rgb(87,107,148)')
                  .margin({ left: 5 })
              }
              .height(50)
            }
            .backgroundColor(Color.White)

            ListItem() {
              Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
                Image($r('app.media.person_video'))
                  .width(25)
                  .height(25)

                Text('音视频童话')
                  .fontSize(19)
                  .fontWeight(700)
                  .fontColor('rgb(87,107,148)')
                  .margin({ left: 5 })
              }
              .height(50)
            }
            .backgroundColor(Color.White)
          }
          .divider({ strokeWidth: 1, color: 'rgb(247,247,247)', startMargin: 0, endMargin: 0 }) // 每行之间的分界线

        }
        .width('100%')
        .height('100%')
      }
      .title(this.NavTitle())
      .mode(NavigationMode.Stack)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(false)
      .menus(this.NavMenus())
      .size({ width: '100%', height: '100%' })
      .backgroundColor('rgb(237,237,237)')
    }
    .width('100%')
    .height('100%')

  }

  @Builder NavMenus() { // CustomBuilder类型的菜单栏
    Row() {

      Image('/images/we_add.png')
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
    }.justifyContent(FlexAlign.End)
  }

  @Builder NavTitle() {
    Row() {
      // Text("猪头")
      //   .width('100')
    }
    .width('80%')

    .justifyContent(FlexAlign.Center)
  }
}