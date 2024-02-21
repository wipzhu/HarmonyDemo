import { CommonConstants } from '../common/constants/CommonConstants'
import router from '@ohos.router'
import ItemList from '../view/item/ItemList'
import ItemPanelHeader from '../view/item/ItemPanelHeader'
import ItemCard from '../view/item/ItemCard'
import NumberKeyboard from '../view/item/NumberKeyboard'
import RecordItem from '../viewmodel/RecordItem'
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel'
import RecordService from '../service/RecordService'
import RecordType from '../viewmodel/RecordType'

@Entry
@Component
struct ItemIndex {
  @State amount: number = 1
  @State value: string = ''
  @State showPanel: boolean = false //是否展示面板
  @State item: RecordItem = null
  @State type: RecordType = RecordTypes[0]
  @State isFood: boolean = true

  onPanelShow(item: RecordItem) {
    this.amount = 1
    this.value = ''
    this.item = item
    this.showPanel = true
  }

  onPageShow() {
    let params: any = router.getParams()
    // 获取饮食记录类型
    this.type = params['type']
    //判断食物或运动
    this.isFood = this.type.id !== RecordTypeEnum.WORKOUT
  }

  build() {
    Column() {
      // 头部导航
      this.Header()

      // 列表
      ItemList({ showPanel: this.onPanelShow.bind(this), isFood: this.isFood }) // 绑定ItemList中的showPanel方法
        .layoutWeight(1)

      // 底部面板
      Panel(this.showPanel) {
        // 顶部日期
        ItemPanelHeader({ type: $type })
        // 记录项信息
        if (this.item) {
          ItemCard({ amount: this.amount, item: $item }) // 对象用link传,link使用$item
        }
        // 数字键盘
        NumberKeyboard({ amount: $amount, value: $value }) // @Link用$amount，不用this.amount
        // 按钮
        Row({ space: CommonConstants.SPACE_12 }) {
          Button('取消')
            .width(120)
            .backgroundColor($r('app.color.light_gray'))
            .borderRadius(CommonConstants.SPACE_6)
            .type(ButtonType.Normal)
            .onClick(() => this.showPanel = false)

          Button('提交')
            .width(120)
            .backgroundColor($r('app.color.primary_color'))
            .borderRadius(CommonConstants.SPACE_6)
            .type(ButtonType.Normal)
            .onClick(() => {
              // 持久化保存
              RecordService.insert(this.type.id, this.item.id, this.amount)
                .then(() => {
                  this.showPanel = false
                })
            })
        }
        .margin({ top: 6 })

      }
      .mode(PanelMode.Full)
      .dragBar(true)
      .backgroundMask($r('app.color.light_gray'))
      .backgroundColor(Color.White)

    }
    .width('100%')
    .height('100%')
  }

  @Builder Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .height(24)
        .onClick(() => router.back())

      Blank()

      Text(this.type.name).fontWeight(CommonConstants.FONT_WEIGHT_600).fontSize(18)


    }
    .padding({ top: CommonConstants.SPACE_6, bottom: CommonConstants.SPACE_6 })
    .width(CommonConstants.THOUSANDTH_940)

  }
}