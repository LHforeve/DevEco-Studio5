import { router } from '@kit.ArkUI';
import { Size } from '@ohos/hypium';

@Component
@Entry
struct PageWork2 {
  build() {
    Column(){
      this.buildReLayout()
    }
  }
  @Builder
  buildReLayout() {
    RelativeContainer() {
      Text('Explore')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin(3)
        .id('text01')
        .margin({ left: 20 })


      TextInput({placeholder:'Artists,songs,podcast'})
        .type(InputType.Normal)
        .width(320)
        .height(60)
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({top:70})
        .id('SRK')

      Button('Dance', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({top:220})
        .id('Btn1')

      Button('Pop', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor('red')
        .borderRadius(10)
        .margin({top:220,left:110})
        .id('Btn2')


      Button('Latin', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .margin({top:220,left:180})
        .id('Btn3')

      Button('Jazzz', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .margin({top:220,left:260})
        .id('Btn4')

      Button('Electronic', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({top:290})
        .id('Btn5')

      Button('Classical', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .margin({top:290,left:135})
        .id('Btn6')

      Button('Comedy', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .margin({top:290,left:240})
        .id('Btn7')

      Button('Electronic', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({top:440})
        .id('Btn8')

      Button('Hi Party', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .margin({top:440,left:135})
        .id('Btn9')

      Button('At home', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .margin({top:440,left:235})
        .id('Btn10')

      Button('Relax', { type: ButtonType.Normal, stateEffect: true })
        .height(60)
        .backgroundColor(0xFFD3D3D3)
        .borderRadius(10)
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({top:510})
        .id('Btn11')


      Text('Genres')
        .fontSize(25)
        .margin(3)
        .id('text03')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:170})
        .fontWeight(FontWeight.Bold)

      Text('View all')
        .fontSize(20)
        .margin(3)
        .id('text04')
        .alignRules({
          center: { anchor: 'text03', align: VerticalAlign.Center },
        })
        .fontColor('red')
        .margin({ left:270})

      Text('Mood & Events')
        .fontSize(25)
        .margin(3)
        .id('text05')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:390})
        .fontWeight(FontWeight.Bold)

      Text('View all')
        .fontSize(20)
        .margin(3)
        .id('text06')
        .alignRules({
          center: { anchor: 'text05', align: VerticalAlign.Center },
        })
        .fontColor('red')
        .margin({ left:270})


      Image($r('app.media.a1'))
        .width(50).height(50)
        .id('img08')
        .margin({ top:650,left:40})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork'
          })
        })


      Image($r('app.media.a2'))
        .width(50).height(50)
        .id('img09')
        .alignRules({
          top: { anchor: 'img08', align: VerticalAlign.Top},
        })
        .margin({ left:115})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork2'
          })
        })


      Image($r('app.media.a3'))
        .width(50).height(50)
        .id('img10')
        .alignRules({
          top: { anchor: 'img08', align: VerticalAlign.Top},
        })
        .margin({ left:195})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork3'
          })
        })

      Image($r('app.media.a4'))
        .width(50).height(50)
        .id('img11')
        .alignRules({
          top: { anchor: 'img08', align: VerticalAlign.Top},
        })
        .margin({ left:270})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork4'
          })
        })











    }
  }
}