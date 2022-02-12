import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('user_action', { schema: 'datawhale' })
export class UserActionEntity {
  @PrimaryGeneratedColumn({
    type: 'int',
    name: 'id',
    comment: 'id',
    unsigned: true
  })
  id: number;

  @Column('varchar', {
    name: 'session_id',
    nullable: true,
    comment: '用户id',
    length: 512
  })
  sessionId: string | null;

  @Column('text', {
    name: 'log_list',
    nullable: true,
    comment: '用户上报的日志列表'
  })
  logList: string | null;

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
