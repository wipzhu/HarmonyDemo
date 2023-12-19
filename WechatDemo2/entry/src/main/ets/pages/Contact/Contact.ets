import router from '@ohos.router'
import { DiscoverRow } from '../Discover/Discover'

@Entry
@Component
export default struct Contact {
  @State fList: object[] = [
    {
      "letter": "L",
      "data": [
        { "name": "老张", "avtar": "/images/avatar2.png", "wx_id": "lao_zhang" }, {
        "name": "老李",
        "avtar": "/images/avatar3.png",
        "wx_id": "lao_li"
      },
        { "name": "吕青山", "avtar": "/images/avatar1.png", "wx_id": "lv_qing_shan" }
      ]
    },
    {
      "letter": "W",
      "data": [{ "name": "王富贵", "avtar": "/images/avatar3.png", "wx_id": "fu_gui" }, {
        "name": "wipzhu",
        "avtar": "/images/ggbond.jpg",
        "wx_id": "ggbond"
      }]
    },
    {
      "letter": "Z",
      "data": [
        { "name": "猪头", "avtar": "/images/avatar1.png", "wx_id": "piggy" }, {
        "name": "张梦珍",
        "avtar": "/images/avatar2.png",
        "wx_id": "dream_true"
      },
        { "name": "朱小花", "avtar": "/images/avatar3.png", "wx_id": "wipzhu" }, {
        "name": "庄周",
        "avtar": "/images/avatar2.png",
        "wx_id": "butter_fly"
      },
        { "name": "脏脏包", "avtar": "/images/ggbond.jpg", "wx_id": "dirty_guy" }]
    }
  ]
  @State letters: string[] = ['L', 'W', 'Z', '#']
  // private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
  //   'H', 'I', 'J', 'K', 'L', 'M', 'N',
  //   'O', 'P', 'Q', 'R', 'S', 'T', 'U',
  //   'V', 'W', 'X', 'Y', 'Z']

  build() {
    Navigation() {

      Stack({ alignContent: Alignment.End }) {

        Column() {
          // TextInput({ placeholder: 'tap to search' })
          //   .width('92%')
          //   .height(42)
          //   .borderRadius(6)
          //   .backgroundColor(Color.White)
          //   .textAlign(TextAlign.Center)
          //   .margin({ bottom: 15 })

          List() {
            ListItem() {
              ContactRow({ iconPath: $r('app.media.contact_icon_1'), titleStr: '新的朋友' })
            }

            ListItem() {
              ContactRow({ iconPath: $r('app.media.contact_icon_2'), titleStr: '仅聊天的朋友' })
            }

            ListItem() {
              ContactRow({ iconPath: $r('app.media.contact_icon_3'), titleStr: '群聊' })
            }

            ListItem() {
              ContactRow({ iconPath: $r('app.media.contact_icon_4'), titleStr: '标签' })
            }

            ListItem() {
              ContactRow({ iconPath: $r('app.media.contact_icon_5'), titleStr: '公众号' })
            }

            ListItemGroup({ header: this.itemHeader('我的企业及企业联系人') }) {
              ListItem() {
                ContactRow({ iconPath: $r('app.media.contact_icon_6'), titleStr: '企微联系人' })
              }

              ListItem() {
                ContactRow({ iconPath: $r('app.media.contact_icon_7'), titleStr: 'wipzhu专用' })
              }
            }

            ForEach(this.fList, (item: object, index: number) => {
              ListItemGroup({ header: this.itemHeader(item['letter']) }) {
                ForEach(item['data'], (datum: object, index: number) => {
                  ListItem() {
                    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                      Image(datum['avtar'])
                        .width(40)
                        .height(40)
                        .borderRadius(5)
                      Text(datum['name'])
                        .fontSize(18)
                        .margin({ left: 15 })
                    }
                    .padding({ top: 8, left: 15, right: 15, bottom: 5 })
                  }
                  .onClick(() => {
                    router.pushUrl({ url: 'pages/Contact/PersonalPage', params: {
                      person: datum
                    }
                    })
                  })
                })
              }
            })

            ListItem() {
              Row() {
                Text("n个朋友")
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
              .backgroundColor('rgb(237,237,237)')
              .padding(12)
              .justifyContent(FlexAlign.Center)
            }
          }
          .width('100%')
          .height('100%')
          .backgroundColor(Color.White)
          .divider({ strokeWidth: 1, color: '#ffe7e7e7', startMargin: 60, endMargin: 0 })
        }
        .layoutWeight(1)
        .height('100%')

        AlphabetIndexer({ arrayValue: this.letters, selected: 0 })
          .color(Color.Black)
          .selectedColor(Color.White) // 选中项文本颜色
          .selectedBackgroundColor('rgba(181, 181, 181, 1.00)') // 选中项背景颜色
          .selectedFont({ size: 13, weight: FontWeight.Bolder }) // 选中项字体样式
          .usingPopup(true) // 是否显示弹出框
          .popupColor(Color.Red) // 弹出框文本颜色
          .popupFont({ size: 30, weight: FontWeight.Bolder }) // 弹出框内容的字体样式
          .itemSize(20) // 每一项的尺寸大小
          .alignStyle(IndexerAlign.Left) // 弹出框在索引条左侧弹出
          .onSelect((index: number) => {
            console.info(this.letters[index] + ' Selected!')
          })
            // .onRequestPopupData((index: number) => {})
          .onPopupSelect((index: number) => {
            console.info('onPopupSelected:' + index)
          })
      }

    }
    .title(this.navTitle())
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .menus(this.navMenus())
    .hideBackButton(true)
    .size({ width: '100%', height: '100%' })
    .backgroundColor('rgb(237,237,237)')

  }

  @Builder itemHeader(text: string) {
    Row() {
      Text(text)
        .fontColor('#ff9b9b9b')
        .fontSize(12)
        .padding({ left: 15, top:5, bottom:5 })
    }
    .margin({})
    .width('100%')
    .height(32)
    .backgroundColor('#ededed')
    .justifyContent(FlexAlign.Start)

  }

  @Builder navTitle() {
    Row() {
      Text("Contact")
        .width('100')
    }
    .width('100%')
    .margin(0)
    .justifyContent(FlexAlign.Center)

  }

  @Builder navMenus() {
    Row() {
      Image('/images/contact_add.png')
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
        .onClick(() => {
        })
    }.justifyContent(FlexAlign.End)

  }
}

@Component
export struct ContactRow {
  iconPath: Resource
  titleStr: string

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Image(this.iconPath)
          .width(46)
          .height(46)

        Text(this.titleStr)
          .fontSize(18)
          .margin({ left: 15 })
      }

    }
    .padding({ left: 10, right: 10, top: 5, bottom: 5 })
  }
}

