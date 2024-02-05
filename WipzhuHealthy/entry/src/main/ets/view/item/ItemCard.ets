import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItem from '../../viewmodel/RecordItem'

@Preview
@Component
export default struct ItemCard {
  @Prop amount: number // 接收数字键盘传值
  @Link item: RecordItem

  build() {
    Column() {
      Image(this.item.image).width(120)

      Row() {
        Text(this.item.name)
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
      }
      .margin({ top: 10, bottom: 10 })
      .padding({ top: 5, bottom: 5, left: 12, right: 12 })
      .borderRadius(CommonConstants.SPACE_12)
      .backgroundColor($r('app.color.lightest_primary_color'))

      Divider().width(CommonConstants.THOUSANDTH_940)
        .opacity(0.6)
        .margin({ top: CommonConstants.SPACE_10 })

      Row({ space: CommonConstants.SPACE_8 }) {
        this.NutrientInfo('热量（千卡）', this.item.calorie)
        if (this.item.carbon) this.NutrientInfo('碳水（克）', this.item.carbon)
        if (this.item.protein) this.NutrientInfo('蛋白质（克）', this.item.protein)
        if (this.item.fat) this.NutrientInfo('脂肪（克）', this.item.fat)
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

        Text(this.item.unit)
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