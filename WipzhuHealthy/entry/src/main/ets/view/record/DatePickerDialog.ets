import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct DatePickerDialog {
  controller: CustomDialogController

  @State isLunar: boolean = false
  selectedDate: Date = new Date()

  build() {
    Column({space:CommonConstants.SPACE_12}) {
      //日期选择容器
      DatePicker({
        start: new Date('2024-01-01'),
        end: new Date('2030-12-31'),
        selected: this.selectedDate
      })
        .lunar(this.isLunar)
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
          console.info('testTag', 'select current date is: ' + JSON.stringify(value))
        })

      // 按钮
      Row({space:CommonConstants.SPACE_12}){
        Button('取消').width(120).backgroundColor($r('app.color.light_gray'))
          .onClick(() => this.controller.close())
        Button('确定').width(120).backgroundColor($r('app.color.primary_color'))
          .onClick(() => {
            // 保存日期到全局存储
            AppStorage.SetOrCreate('selectedDate', this.selectedDate.getTime())

            // 关闭弹窗
            this.controller.close()
          })
      }
    }
    .padding(CommonConstants.SPACE_12)

  }
}