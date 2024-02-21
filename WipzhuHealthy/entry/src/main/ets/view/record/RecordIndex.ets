import DateUtil from '../../common/utils/DateUtil'
import RecordService from '../../service/RecordService'
import RecordVO from '../../viewmodel/RecordVO'
import RecordList from './RecordList'
import SearchHeader from './SearchHeader'
import StatisticCard from './StatisticCard'

@Preview
@Component
export default struct RecordIndex {
  @StorageProp('selectedDate')
  @Watch('aboutToAppear')
  selectedDate:number = DateUtil.beginTimeOfDay(new Date())
  @Provide records:RecordVO[] = []
  @Prop @Watch('handlePageShow') isPageShow:boolean

  handlePageShow() {
    if (this.isPageShow) {
      this.aboutToAppear()
    }
  }

  async aboutToAppear() {
    this.records = await RecordService.queryRecordByDate(this.selectedDate)
  }

  build() {
    Column() {
      //头部搜索栏
      SearchHeader()

      //统计卡片
      StatisticCard()

      //列表
      RecordList().layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_page_background'))
  }
}