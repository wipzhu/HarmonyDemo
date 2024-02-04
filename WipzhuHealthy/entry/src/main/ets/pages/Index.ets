import { CommonConstants } from '../common/constants/CommonConstants'
import RecordIndex from '../view/record/RecordIndex'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State tabCurrentIndex: number = 0

  @Builder TabBuilder(title: ResourceStr, image: ResourceStr, index: number) {
    Column({ space: CommonConstants.SPACE_4 }) {
      Image(image).width(24).fillColor(this.selectColor(index))
      Text(title).fontSize(14).fontColor(this.selectColor(index))
    }
    .justifyContent(FlexAlign.Center)
  }

  selectColor(index: number) {
    return this.tabCurrentIndex === index ? $r('app.color.primary_color') : $r('app.color.light_gray')
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        RecordIndex()
      }
      .tabBar(this.TabBuilder($r('app.string.tab_record'), $r('app.media.ic_calendar'), 0))

      TabContent() {
        Text('这是发现页面')
      }
      .tabBar(this.TabBuilder($r('app.string.tab_discover'), $r('app.media.discover'), 1))

      TabContent() {
        Text('这是我的页面')
      }
      .tabBar(this.TabBuilder($r('app.string.tab_user'), $r('app.media.ic_user_portrait'), 2))
    }
    .width('100%')
    .onChange(index => {
      this.tabCurrentIndex = index
    })
  }
}