import { UserActionEntity } from '../entity/userActionEntity';
import { Between, getRepository } from 'typeorm';
import { config } from '../config';
import path from 'path';
import fse from 'fs-extra';
import { ShadowTrackerAnalyzer } from 'shadow-tracker-analyzer';

export class UserActionService {
  private activityRepository = getRepository(UserActionEntity);

  addUserAction = async (sessionId: string, logList: string) => {
    let actions = new UserActionEntity();
    actions.sessionId = sessionId;
    actions.logList = logList;
    actions.createTime = new Date();
    actions.modifyTime = new Date();
    await this.activityRepository.save(actions);
  };

  getUserAction = async (startTime: string, endTime: string, limit: number) => {
    const res = await this.activityRepository.find({
      where: {
        createTime: Between(new Date(startTime), new Date(endTime))
      },
      take: limit
    });

    const output = [];
    const sessionLogList = res.map((item) => item.logList);

    sessionLogList.forEach((item) => {
      const logList = JSON.parse(item);
      output.push(...logList);
    });

    return output;
  };

  analyzeUserAction = async (startTime: string, endTime: string, limit = 10000) => {
    const output = await this.getUserAction(startTime, endTime, limit);

    const analyzer = new ShadowTrackerAnalyzer({
      maxLogListLength: 20000,
      jumpOutTimeLimit: 30 * 1000
    });

    try {
      analyzer.addLog(output);
    } catch (e) {
      throw Error('日志太多，分析不过来了QAQ')
    }

    const overviewData = analyzer.getOverview();
    const urlStatisticData = analyzer.getUrlStatisticInfo();
    const { screenInfo, clientInfo, browserInfo } = analyzer.getDeviceInfo();
    const performanceData = analyzer.getPerformanceInfo();

    return {
      overview: overviewData,
      urlStatistic: urlStatisticData.sort((a, b) => {
        return b.visitNumber - a.visitNumber;
      }),
      device: {
        screenInfo: screenInfo.sort((a, b) => {
          return b.number - a.number;
        }),
        clientInfo: clientInfo.sort((a, b) => {
          return b.number - a.number;
        }),
        browserInfo: browserInfo.sort((a, b) => {
          return b.number - a.number;
        })
      },
      performance: performanceData
    };
  };

  exportUserAction = async (startTime: string, endTime: string, limit = 10000) => {
    const output = await this.getUserAction(startTime, endTime, limit);

    const logDirPath = path.join(config.staticFilePath, 'log');
    const logFileName = `export-${Date.now()}.log`;
    const logFilePath = path.join(logDirPath, logFileName);
    await fse.ensureDir(logDirPath);
    await fse.writeFile(logFilePath, JSON.stringify(output), {
      flag: 'w+'
    });

    return logFileName;
  };
}
