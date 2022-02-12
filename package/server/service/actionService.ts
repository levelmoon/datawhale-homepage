import { UserActionEntity } from '../entity/userActionEntity';
import { getRepository } from 'typeorm';

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
}
