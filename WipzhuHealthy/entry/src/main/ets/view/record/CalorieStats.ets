import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct CalorieStats {
  intake: number = 192
  expend: number = 150
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  build() {

    Row({ space: CommonConstants.SPACE_6 }) {
      this.StatsBuilder('饮食摄入', this.intake)

      Stack() {

        Progress({
          value: this.intake,
          total: this.recommend,
          type: ProgressType.Ring
        })
          .width(120)
          .style({ strokeWidth: CommonConstants.DEFAULT_10 })
          .color($r('app.color.primary_color'))

        this.StatsBuilder('还可以吃', (this.recommend - this.intake + this.expend), `推荐${this.recommend}`)
      }

      this.StatsBuilder('运动消耗', this.expend)
    }
    .width('100%')
    .padding({ top: 30, bottom: 35 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder StatsBuilder(label: string, value: number, tips?: string) {
    Column({ space: 5 }) {
      Text(label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text(value.toFixed(0))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if (tips) {
        Text(tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
      }
    }
  }
}