import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export default struct ItemCard {
  @Prop amount: number // 接收数字键盘传值

  build() {
    Column() {
      Image($r('app.media.toast')).width(150)

      Row() {
        Text('全麦面包')
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
      }
      .padding({ top: 5, bottom: 5, left: 12, right: 12 })
      .borderRadius(CommonConstants.SPACE_12)
      .backgroundColor($r('app.color.lightest_primary_color'))

      Divider().width(CommonConstants.THOUSANDTH_940)
        .opacity(0.6)
        .margin({ top: CommonConstants.SPACE_10 })

      Row({ space: CommonConstants.SPACE_8 }) {
        this.NutrientInfo('热量（千卡）', 91)
        this.NutrientInfo('碳水（克）', 15.5)
        this.NutrientInfo('蛋白质（克）', 4.4)
        this.NutrientInfo('脂肪（克）', 4.3)
      }
      .padding({ top: CommonConstants.SPACE_10, bottom: CommonConstants.SPACE_10 })

      Divider().width(CommonConstants.THOUSANDTH_940)
        .opacity(0.6)
        .margin({ bottom: CommonConstants.SPACE_10 })

      Row() {

        Column({ space: CommonConstants.SPACE_4 }) {
          Text(this.amount.toFixed(1))
            .fontSize(50)
            .fontColor($r('app.color.primary_color'))
            .fontWeight(CommonConstants.FONT_WEIGHT_700)
          Divider().width(150).color($r('app.color.primary_color'))
        }

        Text('片')
          .fontSize(14)
          .fontColor($r('app.color.light_gray'))
          .fontWeight(CommonConstants.FONT_WEIGHT_400)
      }

    }

  }

  @Builder NutrientInfo(label: string, value: number) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Text(label).fontColor($r('app.color.light_gray')).fontSize(14)
      Text((value * this.amount).toFixed(1)).fontWeight(CommonConstants.FONT_WEIGHT_600).fontSize(18)
    }

  }
}