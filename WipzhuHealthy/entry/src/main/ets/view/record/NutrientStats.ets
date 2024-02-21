import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
@Preview
export default struct NutrientStats {
  @Prop carbon: number
  @Prop protein: number
  @Prop fat: number
  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build() {

    Row({ space: CommonConstants.SPACE_6 }) {
      this.StatsBuilder({
        label: '碳水化合物',
        value: this.carbon,
        recommend: this.recommendCarbon,
        color: $r('app.color.carbon_color')
      })
      this.StatsBuilder({
        label: '蛋白质',
        value: this.protein,
        recommend: this.recommendProtein,
        color: $r('app.color.protein_color')
      })
      this.StatsBuilder({
        label: '脂肪',
        value: this.fat,
        recommend: this.recommendFat,
        color: $r('app.color.fat_color')
      })
    }
    .width('100%')
    .padding({ top: 30, bottom: 35 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder StatsBuilder($$: {
    label: ResourceStr,
    value: number,
    recommend: number,
    color: Resource
  }) {
    Column({ space: CommonConstants.SPACE_6 }) {

      Stack() {
        Progress({
          value: $$.value,
          total: $$.recommend,
          type: ProgressType.Ring
        })
          .width(95)
          .style({ strokeWidth: CommonConstants.DEFAULT_6 })
          .color($$.color)

        Column({ space: 5 }) {
          Text('摄入推荐')
            .fontSize(12)
            .fontColor($r('app.color.gray'))
          Row() {
            Text(`${$$.value.toFixed(1)}`)
              .fontSize(14)
              .fontWeight(CommonConstants.FONT_WEIGHT_600)
              .fontColor($$.color)
            Text(`/${$$.recommend.toFixed(0)}`)
              .fontSize(16)
              .fontWeight(CommonConstants.FONT_WEIGHT_600)
              .fontColor($r('app.color.gray'))
          }
        }
      }

      Text(`${$$.label}(克)`)
        .fontColor($r('app.color.light_gray'))
    }
  }
}