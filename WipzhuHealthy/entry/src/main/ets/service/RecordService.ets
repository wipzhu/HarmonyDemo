import DateUtil from '../common/utils/DateUtil'
import ItemModel from '../model/ItemModel'
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel'
import RecordVOModel from '../model/RecordVOModel'
import GroupInfo from '../viewmodel/GroupInfo'
import RecordType from '../viewmodel/RecordType'
import RecordVO from '../viewmodel/RecordVO'
import StatsInfo from '../viewmodel/StatsInfo'

class RecordService {
  insert(typeId: number, itemId: number, amount: number) {
    // 1. 获取时间
    let createTime = (AppStorage.Get('selectedDate') || DateUtil.beginTimeOfDay(new Date())) as number

    return RecordVOModel.insert({ typeId, itemId, amount, createTime })
  }

  deleteById(id: number) {
    return RecordVOModel.deleteById(id)
  }

  /**
   * 根据日期查询饮食记录列表
   * @param date 要查询的日期
   * @returns 记录列表
   */
  async queryRecordByDate(date: number): Promise<RecordVO[]>{
    // 1.查询数据库的RecordPO
    let rps = await RecordVOModel.listByDate(date)
    // 2.将RecordPO转为RecordVO
    return rps.map(rp => {
      // 2.1.获取po中的基本属性
      let rv = {id: rp.id, typeId: rp.typeId, amount: rp.amount} as RecordVO
      // 2.2.查询记录项
      rv.recordItem = ItemModel.getById(rp.itemId, rp.typeId !== RecordTypeEnum.WORKOUT)
      // 2.3.计算热量
      rv.calorie = rp.amount * rv.recordItem.calorie
      return rv
    })
  }

  /**
   * 根据记录列表信息统计出热量、营养素信息
   * @param records 饮食记录列表
   * @returns 热量、营养素信息
   */
  calculateStatsInfo(records: RecordVO[]): StatsInfo{
    // 1.准备结果
    let info = new StatsInfo()
    if(!records || records.length <= 0){
      return info
    }
    // 2.计算统计数据
    records.forEach(r => {
      if(r.typeId === RecordTypeEnum.WORKOUT){
        // 运动，累加消耗热量
        info.expend += r.calorie
      }else{
        // 食物，累加摄入热量、蛋白质、碳水、脂肪
        info.intake += r.calorie
        info.carbon += r.recordItem.carbon * r.amount
        info.protein += r.recordItem.protein * r.amount
        info.fat += r.recordItem.fat * r.amount
      }
    })
    // 3.返回
    return info
  }

  /**
   * 将记录列表按照记录类型分组
   * @param records 记录列表
   * @returns 分组记录信息
   */
  calculateGroupInfo(records: RecordVO[]): GroupInfo<RecordType, RecordVO>[]{
    // 1.创建空的记录类型分组
    let groups = RecordTypes.map(recordType => new GroupInfo(recordType, []))
    if(!records || records.length <= 0){
      return groups
    }
    // 2.遍历所有饮食记录，
    records.forEach(record => {
      // 2.1.把每个记录存入其对应类型的分组中
      groups[record.typeId].items.push(record)
      // 2.2.计算该组的总热量
      groups[record.typeId].calorie += record.calorie
    })
    return groups
  }
}

let recordService = new RecordService()

export default recordService as RecordService