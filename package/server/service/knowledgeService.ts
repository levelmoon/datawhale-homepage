import { KnowledgeEntity } from '../entity/knowledgeEntity';
import { getRepository, FindManyOptions } from 'typeorm';

export class KnowledgeService {
  private knowledgeRepository = getRepository(KnowledgeEntity);

  find = async (query: FindManyOptions<KnowledgeEntity>) => {
    return this.knowledgeRepository.find(query);
  };

  findAvailableKnowledge = async () => {
    const availableList = await this.find({
      where: {},
      take: 100,
      skip: 0
    });

    const output = availableList.map((item) => {
      return {
        id: item.id,
        name: item.name,
        content: item.content
      };
    });

    return output;
  };
	findAvailableKnowledgeMind = async () => {
    const availableList = await this.find({
      where: {},
      take: 100,
      skip: 0
    });
		//这里逻辑还没写
    const output = availableList.map((item) => {
      return {
        id: item.id,
        name: item.name,
        content: item.content
      };
    });

    return output;
  };
}
