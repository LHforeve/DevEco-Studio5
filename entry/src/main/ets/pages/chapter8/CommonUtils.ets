export namespace AppUtils{

  export function exitApp(){
    let appContext = getContext().getApplicationContext();
    appContext.killAllProcesses();
  }

  export function getApplicationBundleName():string{
    let appContext = getContext().getApplicationContext();
    return appContext.applicationInfo.name
  }
}