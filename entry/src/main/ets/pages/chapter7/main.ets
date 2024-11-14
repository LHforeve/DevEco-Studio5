import { router,Prompt } from '@kit.ArkUI'
import { HeaderBar } from '../chapter5/component/HeaderBar'


@Entry
@Component
struct test1 {
  @State textValue: string = 'textvalue'
  @State title: string = '练习'

  build() {
    Column(){
      HeaderBar({ title: this.title })
      Column({ space: 10 }) {
        Text("第7章http")
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        Button("get请求").enabled(true).width('100%').onClick(() => {
          router.pushUrl({
            url: 'pages/chapter7/HttpGetReqPage'
          })
        })
        Button("天气查询").enabled(true).width('100%').onClick(() => {
          router.pushUrl({
            url: 'pages/chapter7/HttpGetReqPage1'
          })
        })
        Button("登录请求").enabled(true).width('100%').onClick(() => {
          router.pushUrl({
            url: 'pages/chapter7/login'
          })
        })
      }.margin(30)
    }
  }}