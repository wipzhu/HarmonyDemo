import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
@Preview
export default struct NutrientStats {
  carbon: number = 23
  protein: number = 9
  fat: number = 7
  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build() {

    Row({ space: CommonConstants.SPACE_6 }) {
      this.StatsBuilder('碳水化合物', this.carbon, this.recommendCarbon, $r('app.color.carbon_color'))
      this.StatsBuilder('蛋白质', this.protein, this.recommendProtein, $r('app.color.protein_color'))
      this.StatsBuilder('脂肪', this.fat, this.recommendFat, $r('app.color.fat_color'))
    }
    .width('100%')
    .padding({ top: 30, bottom: 35 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder StatsBuilder(label: ResourceStr, value: number, recommend: number, color: Resource) {
    Column({ space: CommonConstants.SPACE_6 }) {

      Stack() {
        Progress({
          value: value,
          total: recommend,
          type: ProgressType.Ring
        })
          .width(95)
          .style({ strokeWidth: CommonConstants.DEFAULT_6 })
          .color(color)

        Column({ space: 5 }) {
          Text('摄入推荐')
            .fontSize(12)
            .fontColor($r('app.color.gray'))
          Text(`${value.toFixed(0)}/${recommend.toFixed(0)}`)
            .fontSize(18)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
      }

      Text(`${label}(克)`)
        .fontColor($r('app.color.light_gray'))
    }
  }
}