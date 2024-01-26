import http from '@ohos.net.http'
import ShopInfo from '../viewmodel/ShopInfo'

class ShopModel {
  baseUrl: string = 'http://8.212.161.106:8081'
  page_no: number = 1
  page_size: number = 4

  /**
   * 基于ohos的http模块实现异步查询商铺
   * @returns
   */
  getShopListByHttp(): Promise<ShopInfo[]> {
    return new Promise((resolve, reject) => {

      let httpRequest = http.createHttp()

      httpRequest.request(
        `${this.baseUrl}/test/wipzhu-test-data`,
        {
          method: http.RequestMethod.GET,
          extraData: {
            page_no: `${this.page_no}`,
            page_sie: `${this.page_size}`
          }
        }
      )
        .then(resp => {
          if (resp.responseCode === 200) {
            // 查询成功
            console.log('testTag', '查询商铺成功！', resp.result)
            resolve(JSON.parse(resp.result.toString()))
          } else {
            console.log('testTag', '查询商铺信息失败！error:', JSON.stringify(resp))
            reject('查询商铺失败')
          }
        })
        .catch(error => {
          console.log('testTag', '查询商铺信息失败！error:', JSON.stringify(error))
          reject('查询商铺失败')
        })
    })
  }
}

const shopModel = new ShopModel();

export default shopModel as ShopModel;