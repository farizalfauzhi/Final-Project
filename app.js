const express       = require('express')
const app           = express()
const port          = 3000
const passport      = require('passport')
const cookieParser  = require('cookie-parser')
const session       = require('express-session')

const c_beranda         = require('./controller/c_beranda')
const c_auth            = require('./controller/c_auth')
const c_dashboard       = require('./controller/c_dashboard')
const c_user            = require('./controller/c_user')
const c_master_produk   = require('./controller/c_master_produk')
const c_stok            = require('./controller/c_stok')
const c_laporan         = require('./controller/c_laporan')
const cek_login         = c_auth.cek_login

app.use(cookieParser('secret'))
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: false,
    cookie: {
        maxAge: 1000 * 60 * 60 * 2
    }
}))
app.use(passport.initialize())
app.use(passport.session())

app.use(express.urlencoded({ extended: false }))
app.set('view engine', 'ejs')
app.set('views', './view-html')
app.use(express.static('public'))

// route
app.get('/', c_beranda.index)
app.get('/login', c_auth.form_login)
app.post('/proses-login', c_auth.proses_login)

app.get('/dashboard', cek_login, c_dashboard.index)

app.get('/master-produk', cek_login, c_master_produk.index)
app.get('/master-produk/tambah', cek_login, c_master_produk.form_tambah)
app.post('/master-produk/proses-simpan', cek_login, c_master_produk.proses_simpan)

app.post('/user/all', function(req, res){
  c_user.Create(req, res);
});

app.get('/user-management', cek_login, c_user.index);
app.get('/user/tambah', cek_login, c_user.form_tambah);
app.post('/user/proses-simpan', cek_login, c_user.proses_simpan);
app.get('/user-management/:id/edit', cek_login, c_user.form_edit);
app.post('/user-management/:id/proses-edit', cek_login, c_user.proses_edit);
app.get('/user-management/:id/hapus', cek_login, c_user.hapus);

app.get('/stok-masuk', cek_login, c_stok.form_stok_masuk);
app.post('/stok-masuk/proses-simpan', cek_login, c_stok.proses_stok_masuk);

app.get('/stok-keluar', cek_login, c_stok.form_stok_keluar);
app.post('/stok-keluar/proses-simpan', cek_login, c_stok.proses_stok_keluar);

app.get('/laporan', cek_login, c_laporan.allstok);

app.listen(port, () => {
    console.log(`Aplikasi sudah siap, buka http://localhost:${port}`)
})
