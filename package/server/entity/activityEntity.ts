import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("activity", { schema: "datawhale" })
export class ActivityEntity {
  @PrimaryGeneratedColumn({
    type: "int",
    name: "id",
    comment: "活动id",
    unsigned: true,
  })
  id: number;

  @Column("varchar", {
    name: "name",
    nullable: true,
    comment: "活动名称",
    length: 512,
  })
  name: string | null;

  @Column("varchar", {
    name: "description",
    nullable: true,
    comment: "活动描述",
    length: 512,
  })
  description: string | null;

  @Column("varchar", {
    name: "registration_link",
    nullable: true,
    comment: "报名链接",
    length: 512,
  })
  registrationLink: string | null;

  @Column("timestamp", {
    name: "registration_end_time",
    nullable: true,
    comment: "报名截止时间",
  })
  registrationEndTime: Date | null;

  @Column("timestamp", {
    name: "create_time",
    nullable: true,
    comment: "创建时间",
  })
  createTime: Date | null;

  @Column("timestamp", {
    name: "modify_time",
    nullable: true,
    comment: "修改时间",
  })
  modifyTime: Date | null;
}
