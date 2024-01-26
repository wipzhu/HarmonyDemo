import { Header } from '../common/components/CommonComponents';

class Person{
  name: string
  age: number
  gf: Person

  constructor(name: string, age: number, gf?: Person) {
    this.name = name
    this.age = age
    this.gf = gf
  }
}

@Entry
@Component
struct StatePage2 {
  idx: number = 1
  @State p: Person = new Person('Jack', 21, new Person('柔丝', 18))
  @State gfs: Person[] = [
    new Person('柔丝', 18),
    new Person('露西', 19),
  ]

  build() {
    Column({space: 10}) {
      Header()

      Text(`${this.p.name} : ${this.p.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.p.age++
        })
      Text(`${this.p.gf.name} : ${this.p.gf.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.p.gf.age++
        })
      Button('添加')
        .onClick(() => {
          this.gfs.push(new Person('女友' + this.idx++, 20))
        })

      Text('=女友列表=')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      ForEach(
        this.gfs,
        (p, index) => {
          Row(){
            Text(`${p.name} : ${p.age}`)
              .fontSize(30)
              .onClick(() => {
                this.gfs[index] = new Person(p.name, p.age+1)
              })
            Button('删除')
              .onClick(() => {
                this.gfs.splice(index, 1)
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
      )

    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}


@Component
struct StatePage {
  @State name: string = 'Jack'
  @State age: number = 21

  build() {
    Column() {
      Text(`${this.name} : ${this.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.age++
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}