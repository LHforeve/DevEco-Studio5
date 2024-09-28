import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text("我的标题")
      Button("ArkTS").onClick(()=>{
        router.pushUrl({
          url: 'pages/chapter/Page'
        })
      })
    }
    .width('100%')
  }
}