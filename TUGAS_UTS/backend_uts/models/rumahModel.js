import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;

const Rumah = db.define(
  "Rumah_db",
  {
    lokasi: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    judul_rumah: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Harga:{
      type: DataTypes.TEXT,
      allowNull: false,
    },
    
  },
  {
    freezeTableName: true,
  }
);


(async () => {
  await db.sync();
})();

export default Rumah;
