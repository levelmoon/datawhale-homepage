import { UserActionEntity } from '../entity/userActionEntity';
import { getRepository } from 'typeorm';

export class UserActionService {
  private activityRepository = getRepository(UserActionEntity);

  addUserAction = (data) => {
    let actions = new UserActionEntity();
    actions.sessionId = data.sessionId;
    actions.urls = data.urls.toString();
    actions.actionTime = data.actionTime;
    this.activityRepository.save(actions).catch((err) => {
      console.error(err);
    });
  };
}
