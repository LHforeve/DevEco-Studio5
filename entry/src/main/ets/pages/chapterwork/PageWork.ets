import { router } from '@kit.ArkUI';
@Component
@Entry
struct PageWork {
  build() {
    Column(){
      this.buildReLayout()
    }
  }
  @Builder
  buildReLayout() {
    RelativeContainer() {
      Text('Hai,LH')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin(3)
        .id('text01')
        .margin({ left: 20 })

      Text('Find you favorite song here')
        .fontSize(15)
        .margin(3)
        .id('text02')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
          top: { anchor: 'text01', align: VerticalAlign.Bottom },
        })

      Image($r('app.media.b1'))
        .width(40).height(40)
        .id('img01')
        .alignRules({
          center: { anchor: 'text01', align: VerticalAlign.Center },
        })
        .margin({ left: 300})

      Image($r('app.media.1'))
        .width(310).height(230)
        .id('img02')
        .alignRules({
          start: { anchor: 'text02', align: HorizontalAlign.Start },
        })
        .margin({ top:80})
        .borderRadius(20)

      Text('New Songs')
        .fontSize(25)
        .margin(3)
        .id('text03')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:340})
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

      Image($r('app.media.1'))
        .width(140).height(140)
        .id('img03')
        .alignRules({
          start: { anchor: 'text03', align: HorizontalAlign.Start },
        })
        .margin({ top:390})
        .borderRadius(20)

      Image($r('app.media.2'))
        .width(140).height(140)
        .id('img04')
        .alignRules({
          top: { anchor: 'img03', align: VerticalAlign.Top },
        })
        .borderRadius(20)
        .margin({ left:180})

      Image($r('app.media.3'))
        .width(140).height(140)
        .id('img05')
        .alignRules({
          top: { anchor: 'img03', align: VerticalAlign.Top },
        })
        .borderRadius(20)
        .margin({ left:340})

      Text('All To Well (10 Minute Version)')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .id('text05')
        .alignRules({
          start: { anchor: 'img03', align: HorizontalAlign.Start},
          top: { anchor: 'img03', align: VerticalAlign.Bottom },
          end:{anchor:'img03',align:HorizontalAlign.End},
        })
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(2)
        .ellipsisMode(EllipsisMode.END)

      Text('aSmokin Out  The Window')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .id('text06')
        .alignRules({
          start: { anchor: 'img04', align: HorizontalAlign.Start},
          top: { anchor: 'img04', align: VerticalAlign.Bottom },
          end:{anchor:'img03',align:HorizontalAlign.End},
        })
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(2)
        .ellipsisMode(EllipsisMode.END)

      Text('Easy Easy Easy Easy Editio')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .id('text07')
        .alignRules({
          start: { anchor: 'img05', align: HorizontalAlign.Start},
          top: { anchor: 'img05', align: VerticalAlign.Bottom },
          end:{anchor:'img03',align:HorizontalAlign.End},
        })
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(2)
        .ellipsisMode(EllipsisMode.END)

      Text('Taylot Swift')
        .fontSize(15)
        .margin(5)
        .id('text08')
        .alignRules({
          start: { anchor: 'img03', align: HorizontalAlign.Start},
          top: { anchor: 'text05', align: VerticalAlign.Bottom },
        })
        .fontColor('gray')

      Text('Bruno Mars')
        .fontSize(15)
        .margin(5)
        .id('text09')
        .alignRules({
          start: { anchor: 'img04', align: HorizontalAlign.Start},
          top: { anchor: 'text06', align: VerticalAlign.Bottom },
        })
        .fontColor('gray')

      Text('Adele')
        .fontSize(15)
        .margin(5)
        .id('text10')
        .alignRules({
          start: { anchor: 'img05', align: HorizontalAlign.Start},
          top: { anchor: 'text07', align: VerticalAlign.Bottom },
        })
        .fontColor('gray')



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