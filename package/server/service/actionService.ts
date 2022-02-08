import { UserActionEntity } from '../entity/userActionEntity';
import { getRepository } from 'typeorm';

export class UserActionService {
  private activityRepository = getRepository(UserActionEntity);

  addUserAction = (data) => {
    let actions = new UserActionEntity();
    console.log('数据是啥', data);
    actions.sessionId = data.sessionId;
    actions.urls = data.urls;
    actions.actionTime = data.actionTime;
    this.activityRepository.save(actions).then((res) => {
      console.log('数据存进去了', res);
    });
  };
}
