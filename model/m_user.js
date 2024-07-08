const bcrypt = require('bcryptjs');
const mysql = require('mysql2');
const db = require('../config/database').db;

module.exports = {
    get_semua_user: function() {
        let sql = mysql.format(
            `SELECT * FROM user;`
        );

        return new Promise((resolve, reject) => {
            db.query(sql, function(errorSql, hasil) {
                if (errorSql) {
                    reject(errorSql);
                } else {
                    resolve(hasil);
                }
            });
        });
    },

    tambah: function(req) {
        let data = {
            username: req.body.form_username,
            password: bcrypt.hashSync(req.body.form_password),
            nama_lengkap: req.body.nama_lengkap,
        };
        let sql = mysql.format(
            `INSERT INTO user SET ?`,
            [data]
        );

        return new Promise((resolve, reject) => {
            db.query(sql, function(errorSql, hasil) {
                if (errorSql) {
                    reject(errorSql);
                } else {
                    resolve(hasil);
                }
            });
        });
    },

    get_user_by_id: function(userId) {
        let sql = mysql.format(
            `SELECT * FROM user WHERE id = ?`,
            [userId]
        );

        return new Promise((resolve, reject) => {
            db.query(sql, function(errorSql, hasil) {
                if (errorSql) {
                    reject(errorSql);
                } else {
                    resolve(hasil[0]);
                }
            });
        });
    },

    edit: function(userId, dataUpdate) {
        let sql = mysql.format(
            `UPDATE user SET ? WHERE id = ?`,
            [dataUpdate, userId]
        );

        return new Promise((resolve, reject) => {
            db.query(sql, function(errorSql, hasil) {
                if (errorSql) {
                    reject(errorSql);
                } else {
                    resolve(hasil);
                }
            });
        });
    },

    hapus: function(userId) {
        let sql = mysql.format(
            `DELETE FROM user WHERE id = ?`,
            [userId]
        );

        return new Promise((resolve, reject) => {
            db.query(sql, function(errorSql, hasil) {
                if (errorSql) {
                    reject(errorSql);
                } else {
                    resolve(hasil);
                }
            });
        });
    }
};