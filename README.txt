ISMAIL STORE — VERSI DATABASE ONLINE GRATIS
===============================================

Yang berubah:
- Data stok, penjualan, pelanggan, piutang, biaya, retur, pedagang,
  mutasi stok, tutup buku, dan pengaturan toko disimpan di Supabase Postgres.
- Data tidak lagi bergantung pada localStorage browser untuk data bisnis.
- Login memakai Supabase Auth (email + password).
- Login dengan akun toko yang sama di HP/PC lain => data yang sama.
- RLS membatasi setiap akun agar hanya dapat membaca/mengubah datanya sendiri.
- Session login boleh disimpan oleh Supabase di browser; itu bukan penyimpanan
  data bisnis.

SETUP SINGKAT
1. Buat project gratis di Supabase.
2. Buka SQL Editor, jalankan seluruh isi supabase-schema.sql.
3. Buka Project Settings / Connect / API dan salin:
   - Project URL
   - Publishable key (atau anon key untuk project lama)
4. Edit config.js:
   window.ISMAIL_SUPABASE_CONFIG = {
     url: "https://....supabase.co",
     publishableKey: "..."
   };
5. Upload seluruh folder ini ke GitHub Pages / Cloudflare Pages.
6. Buka aplikasi, pilih "Buat akun baru", daftar dengan email + password.
7. Gunakan akun yang sama di HP dan komputer.

PENTING
- Jangan pernah memasukkan service_role key ke config.js.
- SQL RLS wajib dipasang sebelum aplikasi dipakai.
- Versi ini menyimpan satu kumpulan data per akun toko.
- Jika Anda punya file backup JSON dari aplikasi lama, gunakan menu restore/backup
  setelah login; data backup akan dimasukkan ke database online.
- Karena source lama menyimpan sebagian data hanya di memori, data lama yang belum
  pernah diekspor sebagai backup tidak dapat dipulihkan otomatis setelah halaman
  ditutup.

CATATAN GRATIS
Supabase menyediakan Free Plan dan saat ini mendokumentasikan dua project gratis.
Kuota dan kebijakan layanan dapat berubah, jadi cek halaman pricing resmi jika
pemakaian toko sudah besar.
