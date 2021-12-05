import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("learn_video", { schema: "datawhale" })
export class LearnVideoEntity {
  @PrimaryGeneratedColumn({
    type: "int",
    name: "id",
    comment: "学习视频id",
    unsigned: true,
  })
  id: number;

  @Column("int", { name: "learn_id", nullable: true, comment: "学习id" })
  learnId: number | null;

  @Column("varchar", {
    name: "title",
    nullable: true,
    comment: "视频标题",
    length: 512,
  })
  title: string | null;

  @Column("varchar", {
    name: "video_url",
    nullable: true,
    comment: "视频url",
    length: 512,
  })
  videoUrl: string | null;

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
