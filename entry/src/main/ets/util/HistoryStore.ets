import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export interface HistoryItem {
  id: string;
  category: number;
  result: string;
  timestamp: number;
}

export class HistoryStore {
  static async addHistory(context: common.Context, item: HistoryItem): Promise<void> {
    try {
      let pref = await preferences.getPreferences(context, 'kokology_history');
      let historyJson = await pref.get('history_list', '[]') as string;
      let historyList: HistoryItem[] = JSON.parse(historyJson);

      historyList.unshift(item);

      // Keep only last 20 results
      if (historyList.length > 20) {
        historyList = historyList.slice(0, 20);
      }

      await pref.put('history_list', JSON.stringify(historyList));
      await pref.flush();
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error(`Failed to add history. Code: ${e.code}, message: ${e.message}`);
    }
  }

  static async getHistory(context: common.Context): Promise<HistoryItem[]> {
    try {
      let pref = await preferences.getPreferences(context, 'kokology_history');
      let historyJson = await pref.get('history_list', '[]') as string;
      return JSON.parse(historyJson);
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error(`Failed to get history. Code: ${e.code}, message: ${e.message}`);
      return [];
    }
  }

  static async clearHistory(context: common.Context): Promise<void> {
    try {
      let pref = await preferences.getPreferences(context, 'kokology_history');
      await pref.delete('history_list');
      await pref.flush();
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error(`Failed to clear history. Code: ${e.code}, message: ${e.message}`);
    }
  }
}