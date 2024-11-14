
import { JSON } from '@kit.ArkTS'
import { WeatherVo } from'./model/WeatherResultInfo'

export function getWeatherVo(jsonStr:string):WeatherVo{
  try {
    return JSON.parse(jsonStr) as WeatherVo
  }catch (e){
    console.error(e.dara)
    return new WeatherVo()
  }
}

export function parseJson<T>(jsonStr:string):T | null{
  try {
    const parsed = JSON.parse(jsonStr);
    return parsed as T;
  }catch (e){
    console.error(e);
    return null;
  }
}


