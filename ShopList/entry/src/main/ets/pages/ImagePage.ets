import { Header } from '../common/components/CommonComponents';

@Entry
@Component
struct Index {
  @State imageWidth: number = 150

  build() {
    Column() {
      Header({title: '图片案例'})
      Row(){
        Image($r('app.media.freeBudsPro3'))
          .width(this.imageWidth)
      }
      .width('100%')
      .height(400)
      .justifyContent(FlexAlign.Center)

      Row(){
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        TextInput({text: this.imageWidth.toFixed(0)})
          .width(150)
          .backgroundColor('#FFF')
          .type(InputType.Number)
          .onChange( value => {
            this.imageWidth = parseInt(value)
          })
      }
      .width('100%')
      .padding({left: 14, right: 14})
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .width('91%')

      Row(){
        Button('缩小')
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if(this.imageWidth >= 10){
              this.imageWidth -= 10
            }
          })

        Button('放大')
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if(this.imageWidth < 300){
              this.imageWidth += 10
            }
          })
      }
      .width('100%')
      .margin({ top: 35, bottom: 35 })
      .justifyContent(FlexAlign.SpaceEvenly)


      Slider({
        min: 100,
        max: 300,
        value: this.imageWidth,
        step: 10,
      })
        .width('100%')
        .blockColor('#36D')
        .trackThickness(5)
        .showTips(true)
        .onChange(value => {
          this.imageWidth = value
        })
    }
    .width('100%')
    .height('100%')
  }
}