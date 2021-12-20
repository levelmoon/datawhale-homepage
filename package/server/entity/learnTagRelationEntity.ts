import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('learn_tag_relation', { schema: 'datawhale' })
export class LearnTagRelationEntity {
  @PrimaryGeneratedColumn({
    type: 'int',
    name: 'id',
    comment: '标签id',
    unsigned: true
  })
  id: number;

  @Column('int', { name: 'learn_id', nullable: true, comment: '学习id' })
  learnId: number | null;

  @Column('int', { name: 'learn_tag_id', nullable: true, comment: '标签id' })
  learnTagId: number | null;

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
