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
    name: 'urls',
    nullable: true,
    comment: '用户每的行为url'
  })
  urls: string | null;

  @Column('timestamp', {
    name: 'action_time',
    nullable: true,
    comment: '行为时间'
  })
  actionTime: Date | null;
}
