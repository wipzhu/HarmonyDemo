import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import RecordService from '../../service/RecordService'
import RecordVO from '../../viewmodel/RecordVO'
import StatsInfo from '../../viewmodel/StatsInfo'
import CalorieStats from './CalorieStats'
import DatePickerDialog from './DatePickerDialog'
import NutrientStats from './NutrientStats'

@Component
export default struct StatisticCard {
  // 单向从datePickerDialog中获取已选中的日期
  @StorageProp('selectedDate') selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  @Consume @Watch('handleRecordsChange') records: RecordVO[]
  @State info: StatsInfo = new StatsInfo()
  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickerDialog({ selectedDate: new Date(this.selectedDate) })
  })

  handleRecordsChange() {
    this.info = RecordService.calculateStatsInfo(this.records)
  }

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
        CalorieStats({ intake: this.info.intake, expend: this.info.expend })
        // 营养素统计
        NutrientStats({ carbon: this.info.carbon, protein: this.info.protein, fat: this.info.fat })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      .indicatorStyle({ selectedColor: $r('app.color.primary_color') })

    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)

  }
}