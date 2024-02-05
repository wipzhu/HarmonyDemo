import { CommonConstants } from '../../common/constants/CommonConstants'
import router from '@ohos.router'

@Preview
@Component
export default struct RecordList {
  build() {

    List({ space: CommonConstants.SPACE_10 }) {

      ForEach([1, 2, 3, 4], (item) => {
        ListItem() {
          Column() {
            // 1.分组标题
            Row({ space: CommonConstants.SPACE_4 }) {
              Image($r('app.media.ic_breakfast')).width(24)
              Text('早餐').fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
              Text('建议423~592千卡').grayText()
              Blank()
              Text('190').fontColor($r('app.color.primary_color')).fontSize(12)
              Text('千卡').grayText()
              Image($r('app.media.ic_public_add_norm_filled')).width(24).fillColor($r('app.color.primary_color'))
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/ItemIndex',
                    params: {
                      isFood: true
                    }
                  })
                })
            }
            .width('100%')
            .padding(CommonConstants.SPACE_6)

            List() {
              ForEach([1, 2, 3], (item) => {
                ListItem() {
                  // 2.组内记录列表
                  Row({ space: CommonConstants.SPACE_6 }) {
                    Image($r('app.media.toast')).width(50)
                    Column({ space: CommonConstants.SPACE_4 }) {
                      Text('全麦吐司').fontWeight(CommonConstants.FONT_WEIGHT_500)
                      Text('1片').grayText()
                    }

                    Blank()
                    Text('91千卡').grayText()
                  }
                  .width('100%')
                  .padding(CommonConstants.SPACE_6)
                }
                .swipeAction({ end: this.deleteButton.bind(this) })
              })
            }
            .width('100%')
            // .height('100%')
            // .layoutWeight(1)

          }
          .width('100%')
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_18)
          .padding(CommonConstants.SPACE_12)

        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(CommonConstants.THOUSANDTH_1000)
    .padding({ top: CommonConstants.SPACE_12, bottom: CommonConstants.SPACE_12 })
  }

  @Builder deleteButton() {
    Image($r('app.media.ic_public_delete_filled')).fillColor(Color.Red).width(20).height(20).margin(5)
  }
}

@Extend(Text) function grayText() {
  .fontSize(14).fontColor($r('app.color.light_gray'))
}
