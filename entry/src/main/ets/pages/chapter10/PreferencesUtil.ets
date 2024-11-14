import { preferences,ValueType} from '@kit.ArkData';


//声明一个首选项文件名称
const PREF_DEFAULT_FILE_NAME:string = 'app_default_pref_file'
const TAG = 'PreferencesUtil'

/***
 * 用户首选项工具类
 * 建议放置在 ets/utils/目录下
 */
export class PreferencesUtil{
  private dataPreferences:preferences.Preferences |null = null
  //使用单例
  private static preferencesUtil: PreferencesUtil;
  public static getInstance(): PreferencesUtil {
    if (!PreferencesUtil.preferencesUtil) {
      PreferencesUtil.preferencesUtil = new PreferencesUtil();
    }
    return PreferencesUtil.preferencesUtil;
  }

  //获取Preferences实例
  private getPreferences(context:Context):preferences.Preferences {
    if(this.dataPreferences===null){
      let options: preferences.Options = { name: PREF_DEFAULT_FILE_NAME };
      this.dataPreferences =  preferences.getPreferencesSync(context, options);
    }
    return this.dataPreferences
  }

  /**
   * 设置
   * @param context
   * @param key
   * @param value
   * 在TypeScript中，
   * export type ValueType = number | string | boolean;
   * 这行代码定义了一个名为 ValueType 的类型。这个类型是一个联合类型（Union Type），
   * 意味着它可以是 number（数字）、string（字符串）或者 boolean（布尔值）中的任意一种。
   */
  public put(context:Context,key:string,value:ValueType){
    try{
      this.getPreferences(context).putSync(key,value) //保存
      this.getPreferences(context).flush() //持久化
    } catch (e) {
      console.error(`Failed to flush. Code:${e.code}, message:${e.message}`)
    }
  }
  /***
   * 取值 String
   */
  public getString(context:Context,key:string,defaultValue:ValueType):string{
    let value =   this.getPreferences(context).getSync(key,defaultValue)
    return value as string ;
  }
  /***
   * 取值 Number
   */
  public getNumber(context:Context,key:string,defaultValue:number):number{
    let value =  this.getPreferences(context).getSync(key,defaultValue)
    return value  as number;
  }
  /***
   * 是否存在key
   */
  public has(context:Context,key:string):boolean{
    return this.getPreferences(context).hasSync(key)
  }
}