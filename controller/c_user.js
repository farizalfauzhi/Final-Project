const m_user = require("../model/m_user")
const bcrypt = require('bcryptjs');

module.exports =
{
    index: async function(req, res) {
        try {
            let dataview = {
                konten: 'user-management/index',
                req: req,
                uri_segment: req.path.split('/'),
                users: await m_user.get_semua_user()
            };
            res.render('template/struktur', dataview);
        } catch (error) {
            res.render('error', { error: 'Gagal mengambil data pengguna' });
        }
    },


    form_tambah: function(req,res) {
        let dataview = {
            konten      : 'user-management/form-tambah',
            uri_segment : req.path.split('/'),
            info_error  : null,
        }
        res.render('template/struktur', dataview)
    },


    
    proses_simpan: async function(req,res) {
        try {
            let insert      = await m_user.tambah(req)
            let isi_notif   = `berhasil membuat user baru`
            if (insert.affectedRows > 0) {
                res.redirect(`/user-management?note=sukses&pesan=${isi_notif}`)
            }
        } catch (error) {
            let dataview = {
                konten      : 'user-management/form-tambah',
                req         : req,
                uri_segment : req.path.split('/'),
                info_error  : error,
            }
            res.render('template/struktur', dataview)
        }
    },
    form_edit: async function(req, res) {
        try {
            let userId = req.params.id;
            let user = await m_user.get_user_by_id(userId);

            if (!user) {
                throw new Error('User tidak ditemukan');
            }

            let dataview = {
                konten: 'user-management/form-edit',
                uri_segment: req.path.split('/'),
                info_error: null,
                user: user
            };

            res.render('template/struktur', dataview);
        } catch (error) {
            let dataview = {
                konten: 'user-management/form-edit',
                req: req,
                uri_segment: req.path.split('/'),
                info_error: error.message,
                user: null
            };
            res.render('template/struktur', dataview);
        }
    },
    proses_edit: async function(req, res) {
        try {
            const userId = req.params.id;
            const { form_username, form_password, nama_lengkap } = req.body;

            let updateData = {
                username: form_username,
                nama_lengkap: nama_lengkap
            };
            if (form_password.trim() !== '') {
                updateData.password = bcrypt.hashSync(form_password);
            }

            const updatedUser = await m_user.edit(userId, updateData);

            if (!updatedUser) {
                throw new Error('User tidak ditemukan');
            }

            let isi_notif = `Berhasil mengedit data user`;
            res.redirect(`/user-management?note=sukses&pesan=${isi_notif}`); // Redirect dengan pesan sukses
        } catch (error) {
            let dataview = {
                konten: 'user-management/form-edit',
                req: req,
                uri_segment: req.path.split('/'),
                info_error: error.message,
                user: null
            };
            res.render('template/struktur', dataview);
        }
    },
    hapus: async function(req, res) {
        try {
            let userId = req.params.id;
            let deleteResult = await m_user.hapus(userId);
    
            if (deleteResult.affectedRows > 0) {
                let isi_notif = `Berhasil menghapus user`;
                res.redirect(`/user-management?note=sukses&pesan=${isi_notif}`);
            } else {
                throw new Error('Gagal menghapus user');
            }
        } catch (error) {
            let isi_notif = `Gagal menghapus user: ${error.message}`;
            res.redirect(`/user-management?note=gagal&pesan=${isi_notif}`);
        }
    },
    

}