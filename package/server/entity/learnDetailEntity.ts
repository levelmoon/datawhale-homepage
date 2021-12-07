import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('learn_detail', { schema: 'datawhale' })
export class LearnDetailEntity {
  @PrimaryGeneratedColumn({
    type: 'int',
    name: 'id',
    comment: '学习章节id',
    unsigned: true
  })
  id: number;

  @Column('int', { name: 'learn_id', nullable: true, comment: '学习id' })
  learnId: number | null;

  @Column('varchar', {
    name: 'title',
    nullable: true,
    comment: '章节标题',
    length: 512
  })
  title: string | null;

  @Column('text', {
    name: 'content',
    nullable: true,
    comment: '章节内容，md5格式'
  })
  content: string | null;

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
