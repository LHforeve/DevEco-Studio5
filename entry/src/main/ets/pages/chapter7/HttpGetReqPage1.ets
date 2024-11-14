import { BusinessError } from '@kit.BasicServicesKit'
import { promptAction } from '@kit.ArkUI'
import { requestGet } from './HttpUtils'
import { HeaderBar } from '../component/HeaderBar'
import { http } from '@kit.NetworkKit'
import { WeatherVo } from './model/WeatherResultInfo'
import { parseJson } from './VoUtils'


const urlConst: string = 'http://t.weather.itboy.net/api/weather/city/';
@Entry
@Component
export struct HttpGetReqPage{
  title: string = 'Get请求'
  cityArray:Array<string>= ['福州','泉州','漳州','厦门','莆田']
  cityCodeArray:Array<string>= ['101230101','101230501','101230601','101230201','101230401']
  @State weatherVo :WeatherVo = new WeatherVo()
  @State selectIndex:number =0;
  @State url:string = 'http://t.weather.itboy.net/api/weather/city/'
  @State result: string = ''
  build() {
    Column(){
      HeaderBar({title: this.title })
      Scroll(){
        Column({ space:20 }){
          Select([
            {value:this.cityArray[0]},
            {value:this.cityArray[1]},
            {value:this.cityArray[2]},
            {value:this.cityArray[3]},
            {value:this.cityArray[4]},
          ]).selected(this.selectIndex)
            .value(this.cityArray[this.selectIndex])
            .onSelect((index:number,text?:string)=>{
            this.getWeatherData(this.cityCodeArray[index])
          })
          TextInput({text:this.url}).onChange((value=>{
            this.url = value
          }))
          TextArea({ text: this.result }).height(300).textAlign(TextAlign.Start)
        }.width('100%').padding(30).justifyContent(FlexAlign.Start)
      }
    }.height('100%')
  }
  //获取天气
  getWeatherData(cityCode:String){
    try{
      this.url = urlConst + cityCode
      requestGet(this.url).then((response) =>{
        this.result = response.toString() || ''
        this.weatherVo = parseJson<WeatherVo>(this.result)||new WeatherVo()
        console.info('Response succeeded: ${response}');
      }).catch(( err: BusinessError) => {
        this.result = `Response err: Code is ${err.code}, message is ${JSON.stringify(err)}`
        console.error(this.result);
      });
    }catch (e){
      promptAction.showToast({ message: e.data })
      console.error(e.data)
    }
  }

  onPageShow(): void {
    this.selectIndex = 0
    this.getWeatherData(this.cityCodeArray[this.selectIndex])
  }
}