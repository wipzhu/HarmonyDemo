import RecordList from './RecordList'
import SearchHeader from './SearchHeader'
import StatisticCard from './StatisticCard'

@Preview
@Component
export default struct RecordIndex {
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