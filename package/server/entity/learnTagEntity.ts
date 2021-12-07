import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { LearnEntity } from './learnEntity';

@Entity('learn_tag', { schema: 'datawhale' })
export class LearnTagEntity {
  @PrimaryGeneratedColumn({
    type: 'int',
    name: 'id',
    comment: '标签id',
    unsigned: true
  })
  id: number;

  @Column('int', { name: 'learn_id', nullable: true, comment: '学习id' })
  learnId: number | null;

  @Column('varchar', {
    name: 'name',
    nullable: true,
    comment: '标签名称',
    length: 512
  })
  name: string | null;

  @Column('timestamp', {
    name: 'create_time',
    nullable: true,
    comment: '创建时间'
  })
  createTime: Date | null;

  @Column('timestamp', {
    name: 'modify_time',
    nullable: true,
    comment: '修改时间'
  })
  modifyTime: Date | null;
}
