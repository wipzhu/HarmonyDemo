import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'

@Component
export default struct ItemPanelHeader {
  build() {
    Row() {
      Text('2024-02-03 早餐')
        .fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_500)
        .textAlign(TextAlign.Center)
      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor($r('app.color.gray'))
    }
    .padding({ top: CommonConstants.SPACE_6, bottom: CommonConstants.SPACE_6 })
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.THOUSANDTH_940)
  }
}