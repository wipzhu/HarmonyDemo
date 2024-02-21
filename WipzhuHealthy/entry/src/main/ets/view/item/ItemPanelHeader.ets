import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import DatePickerDialog from '../record/DatePickerDialog'
import RecordType from '../../viewmodel/RecordType'

@Component
export default struct ItemPanelHeader {
  @Link type:RecordType
  // 单向从datePickerDialog中获取已选中的日期
  @StorageProp('selectedDate') selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickerDialog({ selectedDate: new Date(this.selectedDate) })
  })

  build() {
    Row() {
      Text(DateUtil.formatDate(this.selectedDate))
        .fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_500)
        .textAlign(TextAlign.Center)

      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor($r('app.color.gray'))
    }
    .padding({ top: CommonConstants.SPACE_6, bottom: CommonConstants.SPACE_6 })
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.THOUSANDTH_940)
    .onClick(() => {
      this.controller.open()
    })
  }
}