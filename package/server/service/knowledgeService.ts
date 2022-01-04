import { KnowledgeEntity, KNOWLEDGE_TYPE } from '../entity/knowledgeEntity';
import { getRepository, FindManyOptions } from 'typeorm';

export class KnowledgeService {
  private knowledgeRepository = getRepository(KnowledgeEntity);

  find = async (query: FindManyOptions<KnowledgeEntity>) => {
    return this.knowledgeRepository.find(query);
  };

  findAvailableKnowledge = async () => {
    const availableList = await this.find({
      where: {
        type: KNOWLEDGE_TYPE.DETAIL
      }
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
      where: {
        type: KNOWLEDGE_TYPE.MIND
      }
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
}
