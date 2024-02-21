import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct CalorieStats {
  @Prop intake: number
  @Prop expend: number
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  build() {

    Row({ space: CommonConstants.SPACE_6 }) {
      this.StatsBuilder({ label: '饮食摄入', value: this.intake })

      Stack() {

        Progress({
          value: this.intake,
          total: this.recommend,
          type: ProgressType.Ring
        })
          .width(120)
          .style({ strokeWidth: CommonConstants.DEFAULT_10 })
          .color($r('app.color.primary_color'))

        this.StatsBuilder({
          label: '还可以吃',
          value: (this.recommend - this.intake + this.expend),
          tips: `推荐${this.recommend}`
        })
      }

      this.StatsBuilder({ label: '运动消耗', value: this.expend })
    }
    .width('100%')
    .padding({ top: 30, bottom: 35 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  // Builder不会重新渲染视图，需要引用传值（用对象传值）
  @Builder StatsBuilder($$:{label: string, value: number, tips?: string}) {
    Column({ space: 5 }) {
      Text($$.label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text($$.value.toFixed(0))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if ($$.tips) {
        Text($$.tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
      }
    }
  }
}