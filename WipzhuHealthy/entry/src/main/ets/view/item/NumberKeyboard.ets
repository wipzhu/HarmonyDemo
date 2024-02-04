import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct NumberKeyboard {
  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']
  @Link amount: number //双向绑定amount
  @Link value: string //双向绑定value,用户键盘键入的值

  @Styles keyBoxStyle() {
    .height(60)
    .backgroundColor(Color.White)
    .borderRadius(CommonConstants.SPACE_8)
  }

  build() {
    Grid() {
      ForEach(this.numbers, (num) => {
        GridItem() {
          Text(num).fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_700)
        }
        .keyBoxStyle()
        .onClick(() => this.clickNumber(num))
      })

      GridItem() {
        Text('删除').fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_700)
      }
      .keyBoxStyle()
      .onClick(() => this.clickDelete())
    }
    .width('100%')
    .height(280)
    .columnsTemplate('1fr 1fr 1fr')
    // .rowsTemplate('1fr 1fr 1fr 1fr')
    .columnsGap(CommonConstants.SPACE_8)
    .rowsGap(CommonConstants.SPACE_8)
    .padding(CommonConstants.SPACE_8)
    .margin(CommonConstants.SPACE_10)
    .backgroundColor($r('app.color.index_page_background'))
  }

  clickNumber(num: number) {
    // 拼接用户输入的数字
    let val = this.value + num

    // 校验格式是否正确
    let firstIndex = val.indexOf('.')
    let lastIndex = val.lastIndexOf('.')
    if (lastIndex !== firstIndex || (lastIndex !== -1 && lastIndex < val.length - 2)) {
      // 两个小数点 || (存在小数点 && 小数点后超过两位)
      return
    }

    // 将字符串转为数值
    let amount = this.parseFloat(val)
    // 保存
    if (amount > 999) {
      this.amount = 999
      this.value = '999'
    } else {
      this.amount = amount
      this.value = val
    }
  }

  clickDelete() {
    if (this.value.length <= 0) {
      this.amount = 0
      this.value = ''
      return
    }

    this.value = this.value.substring(0, this.value.length - 1)
    this.amount = this.parseFloat(this.value)
  }

  parseFloat(str: string) {
    if (!str) {
      return 0
    }
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1)
    }
    return parseFloat(str)
  }
}