import { CommonConstants } from '../../common/constants/CommonConstants'
import router from '@ohos.router'
import GroupInfo from '../../viewmodel/GroupInfo'
import RecordType from '../../viewmodel/RecordType'
import RecordVO from '../../viewmodel/RecordVO'
import RecordService from '../../service/RecordService'
import promptAction from '@ohos.promptAction'

@Preview
@Component
export default struct RecordList {
  @Consume @Watch('handleRecordsChange') records: RecordVO[]
  @State groups: GroupInfo<RecordType, RecordVO>[] = []

  handleRecordsChange() {
    this.groups = RecordService.calculateGroupInfo(this.records)
  }

  build() {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach(this.groups, (group: GroupInfo<RecordType, RecordVO>) => {
        ListItem() {
          Column() {
            // 1.分组标题
            Row({ space: CommonConstants.SPACE_4 }) {
              Image(group.type.icon).width(24)
              Text(group.type.name).fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
              Text(`建议${group.type.min}~${group.type.max}千卡`).grayText()
              Blank()
              Text(group.calorie.toFixed(0)).fontColor($r('app.color.primary_color')).fontSize(12)
              Text('千卡').grayText()
              Image($r('app.media.ic_public_add_norm_filled')).width(24).fillColor($r('app.color.primary_color'))
            }
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ItemIndex',
                params: {
                  type: group.type
                }
              })
            })
            .width('100%')
            .padding(CommonConstants.SPACE_6)

            List() {
              ForEach(group.items, (item: RecordVO) => {
                ListItem() {
                  // 2.组内记录列表
                  Row({ space: CommonConstants.SPACE_6 }) {
                    Image(item.recordItem.image).width(50)
                    Column({ space: CommonConstants.SPACE_4 }) {
                      Text(item.recordItem.name).fontWeight(CommonConstants.FONT_WEIGHT_500)
                      Text(`${item.amount}${item.recordItem.unit}`).grayText()
                    }
                    .alignItems(HorizontalAlign.Start)

                    Blank()
                    Text(`${item.calorie.toFixed(0)}千卡`).grayText()
                  }
                  .width('100%')
                  .padding(CommonConstants.SPACE_6)
                }
                .swipeAction({ end: this.deleteButton.bind(this) })
              })
            }
            .width('100%')
            // .height('100%')
            // .layoutWeight(1)

          }
          .width('100%')
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_18)
          .padding(CommonConstants.SPACE_12)

        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(CommonConstants.THOUSANDTH_1000)
    .padding({ top: CommonConstants.SPACE_12, bottom: CommonConstants.SPACE_12 })
  }

  @Builder deleteButton() {
    Image($r('app.media.ic_public_delete_filled'))
      .fillColor(Color.Red)
      .width(20)
      .height(20)
      .margin(5)
      .onClick(() => {
        promptAction.showToast({
          message: "假装删除了"
        })
      })
  }
}

@Extend(Text) function grayText() {
  .fontSize(14).fontColor($r('app.color.light_gray'))
}
