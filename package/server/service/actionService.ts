import { UserActionEntity } from '../entity/userActionEntity';
import { Between, getRepository } from 'typeorm';
import { config } from '../config';
import path from 'path';
import fse from 'fs-extra';

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

  exportUserAction = async (startTime: string, endTime: string, limit = 10000) => {
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
