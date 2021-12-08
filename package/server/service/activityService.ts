import { ActivityEntity } from '../entity/activityEntity';
import { getRepository, FindManyOptions, MoreThan } from 'typeorm';

export class ActivityService {
  private activityRepository = getRepository(ActivityEntity);

  find = async (query: FindManyOptions<ActivityEntity>) => {
    return this.activityRepository.find(query);
  };

  findAvailableActivity = async () => {
    const current = new Date();
    const activityList = await this.find({
      where: {
        registrationEndTime: MoreThan(current)
      }
    });

    const availableList = activityList.map((item) => {
      const endTime = new Date(item.registrationEndTime);
      return {
        name: item.name,
        description: item.description,
        link: item.registrationLink,
        endTime: `${endTime.getFullYear()}-${endTime.getMonth()}-${endTime.getDate()}`
      };
    });

    return availableList;
  };
}
