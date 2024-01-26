import { Header } from '../common/components/CommonComponents'
import ShopInfo from '../viewmodel/ShopInfo'
import ShopItem from '../views/ShopItem'
import ShopModel from '../model/ShopModel'

@Entry
@Component
struct ShopPage {
  @State shops: ShopInfo[] = []
  isLoading: boolean = false
  isMore: boolean = true

  aboutToAppear() {
    // 加载商品数据
    this.loadShopInfo()
  }

  build() {
    Column({ space: 10 }) {
      Header({ title: '商铺列表' })

      List({ space: 10 }) {
        ForEach(this.shops, shop => {
          ListItem() {
            ShopItem({ shop: shop })
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .onReachEnd(() => {
        console.log('触底了！')
        if(!this.isLoading && this.isMore){
          this.isLoading = true
          // 翻页
          ShopModel.pageNo++
          this.loadShopInfo()
        }
      })

    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#e1e2e3')
  }

  loadShopInfo(){
    // 加载数据
    ShopModel.getShopListByHttp()
      .then(shops => {
        // 给图片加上服务器地址前缀
        shops.forEach(s => {
          s.images.forEach((src, i) => {
            s.images[i] = 'http://localhost:3000' + src
          })
        })

        this.shops = this.shops.concat(shops)
        this.isLoading = false
        if(!shops || shops.length === 0){
          this.isMore = false
        }
      })
  }
}