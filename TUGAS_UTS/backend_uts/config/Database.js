import { Sequelize } from "sequelize";
 
const db = new Sequelize('db_sewakuy', 'root', '', {
    host: "localhost",
    dialect: "mysql"
});
 
export default db;