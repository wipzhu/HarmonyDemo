import TaskInfo from '../../viewmodel/TaskInfo'
import TaskItem from './TaskItem'
// import TaskModel from '../../model/TaskModel'

@Component
export default struct TaskList {
  // 总任务数量
  @State idx:number = 1
  @Link totalTask: number
  @Link finishTask: number
  // 任务数组
  @State tasks: TaskInfo[] = []

  // 任务信息弹窗
  dialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({onTaskConfirm: this.handleAddTask.bind(this)}),
  })

  aboutToAppear() {
    console.log('testTag', `初始化组件，查询任务列表`)
    this.handleTaskChange()
  }

  handleAddTask(name: string){
    console.log('testTag', `添加任务`)
    this.dialogController.close()
    this.tasks.push(new TaskInfo(this.idx++, name))
    this.handleTaskChange()
  }

  handleTaskChange() {
    this.totalTask = this.tasks.length
    this.finishTask = this.tasks.filter(item => item.finished).length
  }

  build() {
    Column(){
      // 1.新增任务按钮
      Button('新增任务')
        .width(200)
        .margin({bottom: 10})
        .onClick(() => {
          // 打开新增表单对话框
          this.dialogController.open()
        })

      // 2.任务列表
      List({space: 10}){
        ForEach(
          this.tasks,
          (item: TaskInfo, index) => {
            ListItem(){
              TaskItem({item: item, onTaskChange: this.handleTaskChange.bind(this)})
            }
            .swipeAction({end: this.DeleteButton(index, item.id)})
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
    }
  }

  @Builder DeleteButton(index: number, id: number){
    Button(){
      Image($r('app.media.ic_public_delete_filled'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(() => {
        this.tasks.splice(index, 1)
        console.log('testTag', `尝试删除任务，index: ${index}`)
        this.handleTaskChange()
    })
  }
}

@CustomDialog
struct TaskInfoDialog{

  name: string = ''
  onTaskConfirm : (name: string) => void
  controller: CustomDialogController

  build(){
    Column({space: 20}){
      TextInput({placeholder: '输入任务名'})
        .onChange(val => this.name = val)
      Row(){
        Button('确定')
          .onClick(() => {
            this.onTaskConfirm(this.name)
          })
        Button('取消')
          .backgroundColor(Color.Grey)
          .onClick(() => {
            this.controller.close()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .padding(20)
  }
}