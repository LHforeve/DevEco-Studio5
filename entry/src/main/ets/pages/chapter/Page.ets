import { router } from '@kit.ArkUI';


@Entry
@Component

struct Index {
  @State message: string = '我的软件'

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      Button("第1章 概述").enabled(false).width('100%').onClick(()=>{
      })
      Button("第2章 ArkTs").enabled(true).width('100%').onClick(()=>{
        router.pushUrl({
          url: 'pages/chapter1/Page1'
        })
      })
      Button("第3章 组件").enabled(true).width('100%').onClick(()=>{
        router.pushUrl({
          url: 'pages/chapter4/Page2'
        })
      })
      Button("第4章 音乐app作业").enabled(true).width('100%').onClick(()=>{
        router.pushUrl({
          url: 'pages/chapterwork/PageWork'
        })
      })
      Button("第5章 ArkUI").enabled(false).width('100%').onClick(()=>{
        router.pushUrl({
          url: 'pages/chapter5/IndexPage'
        })
      })
    }
    .width('100%')
    .padding(50)

  }
}