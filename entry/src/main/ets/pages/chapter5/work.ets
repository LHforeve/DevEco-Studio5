

@Entry
@Component
struct work {
  @State message: string = '相对布局'

  build() {
    Column(){
      this.buildReLayout()
    }
  }
  @Builder
  buildReLayout() {
    RelativeContainer() {
      Image($r('app.media.img_demo02'))
        .width(80).height(80).borderRadius(40)
        .id('img01')

      Text('王小明')
        .fontSize(20)
        .fontColor('#121212')
        .id('tv01')
        .alignRules({
          start: { anchor: 'img01', align: HorizontalAlign.End },
          bottom: { anchor: 'img01', align: VerticalAlign.Center },
        })
        .margin({ left: 20, bottom: 3 })

      Text('太阳当头照，花儿对我笑。小鸟说早早早，你为什么背上炸药包？我去炸学校，老师不知道。点了火赶紧跑。轰隆一声学校没有了.')
        .fontSize(12)
        .fontColor('#A6A6A6')
        .id('tv02')
        .alignRules({
          start: { anchor: 'tv01', align: HorizontalAlign.Start },
          top: { anchor: 'img01', align: VerticalAlign.Center },
          end:{anchor:'img_arrow',align:HorizontalAlign.Start}
        })
        .margin({ top: 3 ,right:30})
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(2)
        .ellipsisMode(EllipsisMode.END)

      Image($r('app.media.ic_crown'))
        .width(30)
        .height(30)
        .alignRules({
          end:{anchor:'img01',align:HorizontalAlign.End},
          top:{anchor:'img01',align:VerticalAlign.Top},
        }).offset({x:10,y:0})

      Image($r('app.media.ic_arrow'))
        .width(12)
        .height(18)
        .id('img_arrow')
        .alignRules({
          end: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: 'img01', align: VerticalAlign.Top },
        })
        .offset({ x: 10, y: 0 })
    }.width('100%')
    .height('auto')
    .border({ width: 1, color: "#6699FF" }).padding(10)
  }
}


