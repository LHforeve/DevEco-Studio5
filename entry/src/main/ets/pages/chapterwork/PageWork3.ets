import { router } from '@kit.ArkUI';
@Component
@Entry
struct PageWork3 {
  build() {
    Column(){
      this.buildReLayout()
    }
  }
  @Builder
  buildReLayout() {
    RelativeContainer() {
      Text('My Collection')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin(3)
        .id('text01')
        .margin({ left: 20 })

      Image($r('app.media.3'))
        .width(310).height(230)
        .id('img01')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:60})
        .borderRadius(20)

      Image($r('app.media.y1'))
        .width(50).height(50)
        .id('img02')
        .margin({ top:310})
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })

      Image($r('app.media.y2'))
        .width(45).height(45)
        .id('img03')
        .margin({ top:380,left:28})


      Image($r('app.media.y3'))
        .width(45).height(45)
        .id('img04')
        .margin({ top:445,left:28})


      Image($r('app.media.y4'))
        .width(50).height(50)
        .id('img05')
        .margin({ top:510,left:25})


      Image($r('app.media.y5'))
        .width(45).height(45)
        .id('img06')
        .margin({ top:570,left:28})

      Image($r('app.media.JingRu'))
        .width(30).height(30)
        .id('imgJR01')
        .margin({ left:280})
        .alignRules({
          center: { anchor: 'img02', align: VerticalAlign.Center },
        })

      Image($r('app.media.JingRu'))
        .width(30).height(30)
        .id('imgJR02')
        .margin({ left:280})
        .alignRules({
          center: { anchor: 'img03', align: VerticalAlign.Center },
        })

      Image($r('app.media.JingRu'))
        .width(30).height(30)
        .id('imgJR03')
        .margin({ left:280})
        .alignRules({
          center: { anchor: 'img04', align: VerticalAlign.Center },
        })

      Image($r('app.media.JingRu'))
        .width(30).height(30)
        .id('imgJR04')
        .margin({ left:280})
        .alignRules({
          center: { anchor: 'img05', align: VerticalAlign.Center },
        })

      Image($r('app.media.JingRu'))
        .width(30).height(30)
        .id('imgJR05')
        .margin({ left:280})
        .alignRules({
          center: { anchor: 'img06', align: VerticalAlign.Center },
        })


      Text('Tracks')
        .fontSize(25)
        .id('text02')
        .alignRules({
          center: { anchor: 'img02', align: VerticalAlign.Center },
        })
        .margin({left:110})

      Text('Artist')
        .fontSize(25)
        .id('text03')
        .alignRules({
          center: { anchor: 'img03', align: VerticalAlign.Center },
        })
        .margin({left:110})

      Text('Albums')
        .fontSize(25)
        .id('text04')
        .alignRules({
          center: { anchor: 'img04', align: VerticalAlign.Center },
        })
        .margin({left:110})

      Text('Playlists')
        .fontSize(25)
        .id('text05')
        .alignRules({
          center: { anchor: 'img05', align: VerticalAlign.Center },
        })
        .margin({left:110})

      Text('Download')
        .fontSize(25)
        .id('text06')
        .alignRules({
          center: { anchor: 'img06', align: VerticalAlign.Center },
        })
        .margin({left:110})



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