@Preview
@Component
struct TagItem{
  label:string = 'label'
  build() {
    Text(this.label)
      .padding({left:12,right:12,top:4,bottom:4})
      .borderRadius(8).backgroundColor('#ffe5e1e1')
  }
}
