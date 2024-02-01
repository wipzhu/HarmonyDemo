import relationalStore from '@ohos.data.relationalStore';
import TaskInfo from '../viewmodel/TaskInfo';

class TaskModel {

  private rdbStore: relationalStore.RdbStore
  private tableName: string = 'TASK'

  /**
   * 初始化任务表
   */
  initTaskDB(context){
    //1.rdb配置
    const config = {
      name: 'MyApp.db',
      securityLevel:relationalStore.SecurityLevel.S1
    }
    // 2.初始化SQL语句
    const sql = `CREATE TABLE IF NOT EXISTS TASK (
                  ID INTEGER PRIMARY KEY AUTOINCREMENT,
                  NAME TEXT NOT NULL,
                  FINISHED bit
                 )`
    //3.获取rdb
    relationalStore.getRdbStore(context, config, (err, rdbStore) => {
      if (err) {
        console.log('testTag', 'rdb获取失败')
        return
      }

      rdbStore.executeSql(sql)
      console.log('testTag', '创建TASK表成功！')
      this.rdbStore = rdbStore
    })
  }

  /**
   * 查询任务列表
   */
  async getTaskList(){
    // 1.构建查询条件
    let predicates = new relationalStore.RdbPredicates(this.tableName)
    // 2.查询
    let result = await this.rdbStore.query(predicates)

    // 3.解析查询结果
    let tasks:TaskInfo[] = []
    while (!result.isAtLastRow) {
      result.goToNextRow()
      let id = result.getLong(result.getColumnIndex('ID'))
      let name = result.getString(result.getColumnIndex('NAME'))
      let finished = result.getLong(result.getColumnIndex('FINISHED'))
      tasks.push({id, name, finished: !!finished})
    }

    return tasks
  }

  /**
   * 添加一个新的任务
   * @param name 任务名称
   * @returns 任务id
   */
  addTask(name: string): Promise<number>{
    return this.rdbStore.insert(this.tableName, {name, finished:false})
  }

  /**
   * 根据id更新任务状态
   * @param id 任务id
   * @param finished 任务是否完成
   */
  updateTaskStatus(id: number, finished: boolean) {
    let data = {finished: finished}
    let predicates = new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('ID', id)
    return this.rdbStore.update(data, predicates)
  }

  /**
   * 根据id删除任务
   * @param id 任务id
   */
  deleteTaskById(id: number){
    // 1.删除的条件
    let predicates = new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('ID', id)
    // 2.删除操作
    return this.rdbStore.delete(predicates)
  }
}

let taskModel = new TaskModel();

export default taskModel as TaskModel;
