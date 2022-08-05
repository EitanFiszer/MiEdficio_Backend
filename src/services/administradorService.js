import 'dotenv/config'
import pkg from 'pg';


const adminTabla = process.env.DB_TABLA_ADMIN;

export class AdministradorService {

    createAdministrador = async(administrador) => {
        console.log('This is a function on the service');
        console.log('eeeee')
        console.log("lo que recibo",administrador)
        let response
        const query = `INSERT INTO ${adminTabla} (nombre, apellido, mail, contraseña, telefono) VALUES ('${administrador.nombre}', '${administrador.apellido}',  '${administrador.mail}', '${administrador.contraseña}', '${administrador.telefono}') `;
        const query2 = `SELECT * from ${adminTabla}`
        const { Pool } = pkg;
        const pool = new Pool(
            {
                connectionString:   process.env.DB_SERVER,
                ssl: {
                    rejectUnauthorized: false
                }
            })
        const administradores = await pool.query(query2)//trae todo de administradores
        const result = administradores.rows.filter(word => word.mail===administrador.mail || word.contraseña===administrador.contraseña || word.telefono===administrador.telefono);
        console.log(result[0])
        if(result[0] !== undefined){//datos repetidos
            return response
        }
        response = await pool.query(query)//crea un administrador
        pool.end()
        console.log(response)
        
        return response.rowCount;
    }
//hodaaaaaaaaaaaa
    getAdministrador = async(administrador) => {
        const { Pool } = pkg;

        const pool = new Pool(
            {
                connectionString:   process.env.DB_SERVER,
                ssl: {
                    rejectUnauthorized: false
                }
            })
        console.log('This is a function on the service');
        let response = 0
        const query = `SELECT id_administrador from ${adminTabla} WHERE mail='${administrador.mail}' and contraseña='${administrador.contraseña}'`
        response = await pool.query(query)//trae el administrador
        pool.end()
        console.log(response.rows)
        return response.rows;
    }

    getAdministradorById = async(id) => {
        const { Pool } = pkg;

        const pool = new Pool(
            {
                connectionString:   process.env.DB_SERVER,
                ssl: {
                    rejectUnauthorized: false
                }
            })
        console.log('This is a function on the service');
        let response
        const query = `SELECT * from ${adminTabla} WHERE id_administrador='${id}'`;
        response = await pool.query(query)
        pool.end()
        
        return response.rows;
        }
    


}