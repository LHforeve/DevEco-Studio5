/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { distributedKVStore } from '@kit.ArkData';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';


export default class KVStoreUtil {
  private kvManager: distributedKVStore.KVManager | undefined = undefined;
  private context = getContext(this);
  private kvStore: distributedKVStore.SingleKVStore | undefined = undefined;
  private bundleName: string = '';

  constructor(encrypt: boolean, storeId:string) {
    // 本模块提供应用信息查询能力，支持BundleInfo、ApplicationInfo、AbilityInfo、ExtensionAbilityInfo等信息的查询
    let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
    bundleManager.getBundleInfoForSelf(bundleFlags, (err, data) => {
      this.bundleName = data.name;
      const kvManagerConfig: distributedKVStore.KVManagerConfig = {
        context: this.context,
        bundleName: this.bundleName
      };

      //创建 KvManager
      this.kvManager = distributedKVStore.createKVManager(kvManagerConfig);
      const options: distributedKVStore.Options = {
        createIfMissing: true,//当数据库文件不存在时是否创建数据库，默认为true，即创建。
        backup: false,//设置数据库文件是否备份
        autoSync: false,//设置数据库是否支持跨设备自动同步。
        //表示单版本数据库。(另一种多设备协同数据库)
        kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
        encrypt: encrypt, //是否加密
        securityLevel: distributedKVStore.SecurityLevel.S1 //安全级别
      };

      //获取 KVStore
      this.kvManager.getKVStore<distributedKVStore.SingleKVStore>(storeId, options,
        (err, store: distributedKVStore.SingleKVStore) => {
          if (err) {
            hilog.error(0x0000, 'KVStore', `Failed to get KVStore: Code:${err.code},message:${err.message}`);
            return;
          }
          hilog.info(0x0000, 'KVStore', 'Succeeded in getting KVStore.');
          this.kvStore = store;
        });
    })
  }
//保存&更新
  async put(key: string, value: Uint8Array | string | number | boolean) {
    this.kvStore!.put(key, value, (err) => {
      if (err !== undefined) {
        hilog.error(0x0000, 'KVStore', `Failed to put data. Code:${err.code},message:${err.message}`);
        return;
      }
      hilog.info(0x0000, 'KVStore', 'Succeeded in putting data.');
    });
  }
//删除
  async delete(key: string) {
    this.kvStore!.delete(key, (err) => {
      if (err !== undefined) {
        hilog.error(0x0000, 'KVStore', `Failed to delete data. Code:${err.code},message:${err.message}`);
        return;
      }
      hilog.info(0x0000, 'KVStore', 'Succeeded in deleting data.');
    });
  }
//查询所有
  async getAll(): Promise<KvData[]> {
    let allKVStore: KvData[] = [];
    await this.kvStore!.getEntries('^').then((entries: distributedKVStore.Entry[]) => {
      let i = 0;
      for (i; i < entries.length; i++) {
        let type: string = typeof entries[i].value.value;
        if (type === 'object') {
          type = 'Uint8Array';
        }
        let kvStoreType = new KvData(entries[i].key, entries[i].value.value, type);
        allKVStore.push(kvStoreType);
      }
    });
    hilog.info(0x0000, 'KVStore', `kvStoreType: ${JSON.stringify(allKVStore)}`);
    return allKVStore;
  }
}

//KvData数据类
export class KvData {
  dataKey: string = ''
  dataValue: Uint8Array | string | number | boolean;
  dataType?:string

  constructor(inDataKey: string,
    inDataValue: Uint8Array | string | number | boolean,inDataType?:string) {
    this.dataKey = inDataKey
    this.dataValue = inDataValue
    this.dataType = inDataType
  }
}

