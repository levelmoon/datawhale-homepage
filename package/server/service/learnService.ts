import { LearnEntity } from '../entity/learnEntity';
import { getRepository, FindManyOptions, In } from 'typeorm';
import { LearnTagEntity } from '../entity/learnTagEntity';
import { LearnDetailEntity } from '../entity/learnDetailEntity';
import { LearnVideoEntity } from '../entity/learnVideoEntity';
import { removeDuplicateItem } from '../util/removeDuplicate';
import { LearnTagRelationEntity } from '../entity/learnTagRelationEntity';

export class LearnService {
  private learnRepository = getRepository(LearnEntity);
  private learnDetailRepository = getRepository(LearnDetailEntity);
  private learnVideoRepository = getRepository(LearnVideoEntity);
  private learnTagRepository = getRepository(LearnTagEntity);
  private learnTagRelationRepository = getRepository(LearnTagRelationEntity);

  find = async (query: FindManyOptions<LearnEntity>) => {
    return this.learnRepository.find(query);
  };

  findTag = async (query: FindManyOptions<LearnTagEntity>) => {
    return this.learnTagRepository.find(query);
  };

  findTagRelation = async (query: FindManyOptions<LearnTagRelationEntity>) => {
    return this.learnTagRelationRepository.find(query);
  };

  findDetail = async (query: FindManyOptions<LearnDetailEntity>) => {
    return this.learnDetailRepository.find(query);
  };

  findLearn = async (query: FindManyOptions<LearnEntity>) => {
    const learnList = await this.find(query);
    const learnTagRelationList = await this.findTagRelation({
      where: {
        learnId: In(learnList.map((item) => item.id))
      }
    });
    const learnTagList = await this.findTag({
      where: {
        id: In(learnTagRelationList.map((item) => item.learnTagId))
      }
    });
    const learnDetailList = await this.findDetail({
      select: ['id', 'learnId', 'title'],
      where: {
        learnId: In(learnList.map((item) => item.id))
      },
      order: {
        index: 'ASC'
      }
    });

    // 组合learn、tag、detail
    const output = learnList.map((item) => {
      const tagList = learnTagRelationList
        .filter((relation) => relation.learnId === item.id)
        .map((relation) => {
          const tagInfoList = learnTagList.filter((tag) => tag.id === relation.learnTagId);
          if (tagInfoList.length === 0) {
            return {
              tagId: relation.learnTagId,
              tagName: ''
            };
          }

          return {
            tagId: relation.learnTagId,
            tagName: tagInfoList[0].name
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

  findLearnByTag = async (query: FindManyOptions<LearnTagRelationEntity>) => {
    const targetLearnTagRelationList = await this.findTagRelation(query);
    const targetLearnIdList = removeDuplicateItem(
      targetLearnTagRelationList.map((item) => item.learnId)
    );

    return this.findLearn({
      where: {
        id: In(targetLearnIdList)
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
      where: { learnId },
      order: {
        index: 'ASC'
      }
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
