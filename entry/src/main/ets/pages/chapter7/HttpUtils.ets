import { http } from '@kit.NetworkKit'

export function requestGet(url: string):Promise<string> {
  let httpRequest = http.createHttp();
  let promise = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    connectTimeout: 60000,
    readTimeout: 60000,
    header:{
      'Content-type': 'application/json'
    }
  });
  return promise.then((value:http.HttpResponse) =>{
    if (value.responseCode === 200) {
      return value.result.toString()
    }
    return `{code:${value.responseCode}, msg:error`;
  }).finally(()=>{
    httpRequest.destroy();
  })
}

export function requestPostWithFormData(url: string,postParam:Array<http.MultiFormData>):Promise<string> {
    let httpRequest = http.createHttp();
    let promise = httpRequest.request(url, {
      method: http.RequestMethod.POST,
      connectTimeout: 60000,
      readTimeout: 60000,
      header:{
        'Content-type':'multipart/form-data'
      },
      multiFormDataList:postParam
    });
    return promise.then((value:http.HttpResponse) =>{
      if (value.responseCode === 200) {
        return value.result.toString()
      }
      return `{code:${value.responseCode}, msg:error`;
    }).finally(()=>{
      httpRequest.destroy();
    })
}