import { LearnEntity } from '../entity/learnEntity';
import { getRepository, FindManyOptions, In } from 'typeorm';
import { LearnTagEntity } from '../entity/learnTagEntity';

export class LearnService {
  private learnRepository = getRepository(LearnEntity);
  private learnTagRepository = getRepository(LearnTagEntity);

  find = async (query: FindManyOptions<LearnEntity>) => {
    return this.learnRepository.find(query);
  };

  findTag = async (query: FindManyOptions<LearnTagEntity>) => {
    return this.learnTagRepository.find(query);
  };

  findFivePopularLearn = async () => {
    const learnList = await this.find({
      order: { like: 'DESC' },
      take: 5,
      skip: 0
    });
    const learnTagList = await this.findTag({
      where: {
        learnId: In(learnList.map((item) => item.id))
      }
    });

    // 组合learn和tag
    const output = learnList.map((item) => {
      const tagList = learnTagList
        .filter((tag) => tag.learnId === item.id)
        .map((tag) => {
          return {
            tagId: tag.id,
            tagName: tag.name
          };
        });

      return {
        id: item.id,
        name: item.name,
        description: item.description,
        imageUrl: item.imageUrl,
        like: item.like,
        tagList
      };
    });

    return output;
  };
}
