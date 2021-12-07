import { BannerEntity, BANNER_STATUS } from '../entity/bannerEntity';
import { getRepository, FindManyOptions } from 'typeorm';

export class BannerService {
  private bannerRepository = getRepository(BannerEntity);

  find = async (query: FindManyOptions<BannerEntity>) => {
    return this.bannerRepository.find(query);
  };

  findFiveAvailableBanner = async () => {
    const availableList = await this.find({
      where: { status: BANNER_STATUS.INUSE },
      take: 5,
      skip: 0
    });

    const output = availableList.map((item) => {
      return {
        url: item.imageUrl,
        description: item.description
      };
    });

    return output;
  };
}
