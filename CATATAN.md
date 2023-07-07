BAGIAN NAMA KELOLA PENGGUNA JADI KELOLA PELANGGAN
YANG DIPAKAI DBNYA CUMAN:
--user
--transaksis
--struk
--pelanggans
--password_resets
--paket_kilos
--outlets
--checkout_kilos


Association:

transaksis table has an association with pelanggans table based on the kd_pelanggan column.
transaksis table has an association with outlets table based on the id_outlet column.
transaksis table has an association with users table based on the kd_pegawai column.
paket_kilos table has an association with outlets table based on the id_outlet column.
paket_satus table has an association with outlets table based on the id_outlet column.
checkout_kilos table has an association with paket_kilos table based on the kd_paket column.
checkout_satus table has an association with paket_satus table based on the kd_barang column.
struks table has an association with transaksis table based on the kd_invoice column.
Aggregation:

There are no explicit aggregation relationships indicated in the provided table schemas.
Inheritance:

There are no explicit inheritance relationships indicated in the provided table schemas.



1. tinggal bagian GIF (Proses, selesai, bagian home) 
2. Laporan yang Sequence diagram, Activity Diagram✅
3. As-Is Diagram✅
4. Bikin Video
5. pesananan kiloan
