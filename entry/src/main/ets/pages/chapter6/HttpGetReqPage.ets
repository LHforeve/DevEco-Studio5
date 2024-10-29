@Entry
@Component
export struct HttpGetReqPage{
  title: string = 'Get请求'
  @State url:string = 'tp://t.weather.itboy.net/api/weather/city/10123010'
  @State result: string = ''
  build() {
    Column(){
      HeaderBar({ title: this.title })
      Scroll(){
        Column({space:20}){
          TextInput({text:this.url}).onChange((value=>{
            this.url = value
          }))
          Button("Get请求").width('100%').onClick(async ()=>{
            this.getWeatherInfo()
          })
          TextArea({ text: this.result }).height(300).textAlign(TextAlign.Start)
        }.width('100%').padding(30).justifyContent(FlexAlign.Start)
      }
    }.height('100%')
  }
}