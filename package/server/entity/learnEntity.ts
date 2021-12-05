import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm'
import { LearnTagEntity } from './learnTagEntity'

@Entity('learn', { schema: 'datawhale' })
export class LearnEntity {
  @PrimaryGeneratedColumn({
    type: 'int',
    name: 'id',
    comment: '学习id',
    unsigned: true,
  })
  id: number

  @Column('varchar', {
    name: 'name',
    nullable: true,
    comment: '学习名称',
    length: 512,
  })
  name: string | null

  @Column('varchar', {
    name: 'description',
    nullable: true,
    comment: '学习描述',
    length: 512,
  })
  description: string | null

  @Column('varchar', {
    name: 'image_url',
    nullable: true,
    comment: '学习封面图',
    length: 512,
  })
  imageUrl: string | null

  @Column('int', { name: 'like', nullable: true, comment: '学习点赞数' })
  like: number | null

  @Column('timestamp', {
    name: 'create_time',
    nullable: true,
    comment: '创建时间',
  })
  createTime: Date | null

  @Column('timestamp', {
    name: 'modify_time',
    nullable: true,
    comment: '修改时间',
  })
  modifyTime: Date | null
}
