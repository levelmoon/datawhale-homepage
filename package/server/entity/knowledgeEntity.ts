import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("knowledge", { schema: "datawhale" })
export class KnowledgeEntity {
  @PrimaryGeneratedColumn({
    type: "int",
    name: "id",
    comment: "知识体系id",
    unsigned: true,
  })
  id: number;

  @Column("varchar", {
    name: "name",
    nullable: true,
    comment: "知识体系名称",
    length: 512,
  })
  name: string | null;

  @Column("text", {
    name: "content",
    nullable: true,
    comment: "知识体系内容，json格式",
  })
  content: string | null;

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
