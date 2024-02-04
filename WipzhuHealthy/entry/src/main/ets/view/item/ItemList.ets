import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct ItemList {

  showPanel: () => {}

  build() {
    Tabs() {
      TabContent() {this.TabContentBuilder()}.tabBar('全部')
      TabContent() {this.TabContentBuilder()}.tabBar('主食')
      TabContent() {this.TabContentBuilder()}.tabBar('肉蛋奶')
      TabContent() {this.TabContentBuilder()}.tabBar('果蔬')
      TabContent() {this.TabContentBuilder()}.tabBar('坚果')
      TabContent() {this.TabContentBuilder()}.tabBar('其他')
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
  }

  @Builder TabContentBuilder() {

    List() {
      ForEach([1, 2, 3], (item) => {
        ListItem() {
          // 2.组内记录列表
          Row({ space: CommonConstants.SPACE_6 }) {
            Image($r('app.media.toast')).width(50)
            Column({ space: CommonConstants.SPACE_4 }) {
              Text('全麦吐司').fontWeight(CommonConstants.FONT_WEIGHT_500)
              Text('192千卡/克').grayText()
            }

            Blank()
            Image($r('app.media.ic_public_add_norm_filled')).width(24).fillColor($r('app.color.primary_color'))
          }
          .width('100%')
          .padding(CommonConstants.SPACE_6)
          .onClick(() => this.showPanel())
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
    .padding({ top: CommonConstants.SPACE_12, bottom: CommonConstants.SPACE_12 })
  }
}

@Extend(Text) function grayText() {
  .fontSize(14).fontColor($r('app.color.light_gray'))
}