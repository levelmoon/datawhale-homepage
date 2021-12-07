import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('banner', { schema: 'datawhale' })
export class BannerEntity {
  @PrimaryGeneratedColumn({
    type: 'int',
    name: 'id',
    comment: '轮播图id',
    unsigned: true
  })
  id: number;

  @Column('varchar', {
    name: 'image_url',
    nullable: true,
    comment: '轮播图片链接',
    length: 512
  })
  imageUrl: string | null;

  @Column('varchar', {
    name: 'description',
    nullable: true,
    comment: '轮播图描述',
    length: 512
  })
  description: string | null;

  @Column('int', {
    name: 'status',
    nullable: true,
    comment: '轮播图状态，10可用，20不可用'
  })
  status: number | null;

  @Column('timestamp', {
    name: 'create_time',
    nullable: true,
    comment: '创建时间'
  })
  createTime: Date | null;

  @Column('timestamp', {
    name: 'modify_time',
    nullable: true,
    comment: '更新时间'
  })
  modifyTime: Date | null;
}

export enum BANNER_STATUS {
  INUSE = 10,
  UNUSE = 20
}
