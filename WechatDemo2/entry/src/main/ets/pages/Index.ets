import home from './WeChat/Home'

@Entry
@Component
struct Index {
 
  @State message: string = 'Hello World'
  private tabController = new TabsController()
  @State currentIndex: number = 0
  @State selectedColor: string = '#0bbf5b'
  @State normalColor: string = '#ff7e7e7e'
  @State tabTitles:string[] = ["WeChat", "Contact", "Discover", "My"]

  @Builder TabBuilder(index:number) {
    Column(){
      Image(this.currentIndex == index ? `/images/tabbar${index}1.png` : `/images/tabbar${index}0.png`)
        .width(24)
        .height(24)
        .margin({bottom: 6})
        .objectFit(ImageFit.Contain)
      Text(this.tabTitles[index])
        .fontColor(this.currentIndex == index ? this.selectedColor : this.normalColor)
        .fontSize(15)
        .fontWeight(50)
        .lineHeight(14)
    }.width('100%')
  }

  build() {
    Column(){
      Tabs({barPosition:BarPosition.End, controller:this.tabController}) {
        TabContent(){
          home()
        }.tabBar(this.TabBuilder(0))

        TabContent(){
        }.tabBar(this.TabBuilder(1))

        TabContent(){
        }.tabBar(this.TabBuilder(2))

        TabContent(){
        }.tabBar(this.TabBuilder(3))
      }
      .vertical(false)
      .barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('100%')
      .height('100%')
      .backgroundColor('#f7f7f7')
    }
    .width('100%')
    .height('100%')
  }
}