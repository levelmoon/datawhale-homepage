import { LearnEntity } from '../entity/learnEntity';
import { getRepository, FindManyOptions, In } from 'typeorm';
import { LearnTagEntity } from '../entity/learnTagEntity';
import { LearnDetailEntity } from '../entity/learnDetailEntity';
import { LearnVideoEntity } from '../entity/learnVideoEntity';
import { removeDuplicateItem } from '../util/removeDuplicate';

export class LearnService {
  private learnRepository = getRepository(LearnEntity);
  private learnDetailRepository = getRepository(LearnDetailEntity);
  private learnVideoRepository = getRepository(LearnVideoEntity);
  private learnTagRepository = getRepository(LearnTagEntity);

  find = async (query: FindManyOptions<LearnEntity>) => {
    return this.learnRepository.find(query);
  };

  findTag = async (query: FindManyOptions<LearnTagEntity>) => {
    return this.learnTagRepository.find(query);
  };

  findDetail = async (query: FindManyOptions<LearnDetailEntity>) => {
    return this.learnDetailRepository.find(query);
  };

  findLearn = async (query: FindManyOptions<LearnEntity>) => {
    const learnList = await this.find(query);
    const learnTagList = await this.findTag({
      where: {
        learnId: In(learnList.map((item) => item.id))
      }
    });
    const learnDetailList = await this.findDetail({
      select: ['id', 'learnId', 'title'],
      where: {
        learnId: In(learnList.map((item) => item.id))
      }
    });

    // 组合learn、tag、detail
    const output = learnList.map((item) => {
      const tagList = learnTagList
        .filter((tag) => tag.learnId === item.id)
        .map((tag) => {
          return {
            tagId: tag.id,
            tagName: tag.name
          };
        });

      const detailList = learnDetailList
        .filter((detail) => detail.learnId === item.id)
        .map((detail) => {
          return {
            chapterId: detail.id,
            title: detail.title
          };
        });

      return {
        id: item.id,
        name: item.name,
        description: item.description,
        imageUrl: item.imageUrl,
        like: item.like,
        tagList,
        detailList
      };
    });

    return output;
  };

  findLearnByTag = async (query: FindManyOptions<LearnTagEntity>) => {
    const targetLearnTagList = await this.findTag(query);
    const targetLearnList = removeDuplicateItem(targetLearnTagList.map((item) => item.learnId));

    return this.findLearn({
      where: {
        id: In(targetLearnList)
      }
    });
  };

  findLearnDetail = async (learnId: number, chapterId: number) => {
    const learnDetail = await this.learnDetailRepository.findOne({
      id: chapterId,
      learnId
    });

    return {
      chapterId: learnDetail.id,
      learnId: learnDetail.learnId,
      title: learnDetail.title,
      content: learnDetail.content
    };
  };

  findLearnVideo = async (learnId: number) => {
    const learnVideoList = await this.learnVideoRepository.find({
      learnId
    });

    const output = learnVideoList.map((item) => {
      return {
        videoId: item.id,
        learnId: item.learnId,
        videoUrl: item.videoUrl,
        imageUrl: item.imageUrl,
        title: item.title
      };
    });

    return output;
  };
}
