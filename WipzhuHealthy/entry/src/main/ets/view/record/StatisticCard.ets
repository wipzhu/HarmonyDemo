import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import CalorieStats from './CalorieStats'
import DatePickerDialog from './DatePickerDialog'
import NutrientStats from './NutrientStats'

@Component
export default struct StatisticCard {
  // 单向从datePickerDialog中获取已选中的日期
  @StorageProp('selectedDate') selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickerDialog({ selectedDate: new Date(this.selectedDate) })
  })

  build() {
    Column() {
      Row() {
        Text(DateUtil.formatDate(this.selectedDate))
          .fontColor($r('app.color.secondary_color'))
        Image($r('app.media.ic_public_spinner'))
          .width(32)
          .fillColor($r('app.color.secondary_color'))
      }
      .align(Alignment.Start)
      .padding(CommonConstants.SPACE_8)
      .onClick(() => this.controller.open())

      Swiper() {
        // 热量统计
        CalorieStats()
        // 营养素统计
        NutrientStats()
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      .indicatorStyle({selectedColor:$r('app.color.primary_color')})

    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)

  }
}