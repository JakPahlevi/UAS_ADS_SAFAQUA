<?php

namespace App\Http\Controllers;

use App\Checkout_kilo;
use Auth;
use App\User;
use App\Outlet;
use App\Pelanggan;
use App\Transaksi;
use App\Paket_kilo;
use App\Paket_satu;
use Carbon\Carbon;
use Session;
use Illuminate\Http\Request;

class HalDashboardController extends Controller
{
    // Membuka Halaman Dashboard
    public function halamanDashboard()
    {
        $outlets = Outlet::all();
    	$jml_pegawai = User::where('role', 'admin')
    	->orWhere('role', 'kasir')
    	->count();
    	$jml_outlet = Outlet::all()
    	->count();
    	$jml_pelanggan = Pelanggan::all()
    	->count();
    	$jml_selesai = Transaksi::where('status', 'diambil')
    	->count();
    	$pelanggan_harian = Transaksi::select('transaksis.tgl_pemberian')
    	->orderBy('transaksis.tgl_pemberian', 'DESC')
    	->distinct()
    	->take(6)
    	->get();
    	$semua_pelanggan_harian = Transaksi::select('transaksis.tgl_pemberian')
    	->orderBy('transaksis.tgl_pemberian', 'DESC')
    	->distinct()
    	->get();
    	$pelanggan_terbaru = Transaksi::join('pelanggans', 'pelanggans.kd_pelanggan', '=', 'transaksis.kd_pelanggan')
    	->select('transaksis.*', 'pelanggans.nama_pelanggan')
    	->orderBy('transaksis.created_at', 'DESC')
    	->take(7)
    	->get();
    	$pelanggan_bayar = Transaksi::select('transaksis.tgl_bayar')
    	->orderBy('transaksis.tgl_bayar', 'DESC')
    	->whereNotNull('transaksis.tgl_bayar')
    	->distinct()
    	->take(10)
    	->get();
    	$semua_pelanggan_bayar = Transaksi::select('transaksis.tgl_bayar')
    	->orderBy('transaksis.tgl_bayar', 'DESC')
    	->whereNotNull('transaksis.tgl_bayar')
    	->distinct()
    	->get();

    	return view('halaman_dashboard', compact('jml_pegawai', 'jml_outlet', 'jml_pelanggan', 'jml_selesai', 'pelanggan_harian', 'semua_pelanggan_harian', 'pelanggan_terbaru', 'pelanggan_bayar', 'semua_pelanggan_bayar', 'outlets'));
    }

    // Kelola Dashboard Pelanggan
    public function dashboardPelanggan($id)
    {
        $outlets = Outlet::find($id);
        return response()->json([
            'outlets' => $outlets
        ]);
    }

    // Outlet Tabel Kiloan
    public function outletTabelKiloan($id)
    {
        $paket_kilos = Paket_kilo::select('paket_kilos.*')
        ->where('paket_kilos.id_outlet', $id)
        ->get();
        return view('halaman_pesanan_pelanggan.outlet_tabel_kiloan', compact('paket_kilos'));
    }

    // Outlet Tabel Satuan
    public function outletTabelSatuan($id)
    {
        $paket_satus = Paket_satu::select('paket_satus.*')
        ->where('paket_satus.id_outlet', $id)
        ->get();
        return view('halaman_pesanan_pelanggan.outlet_tabel_satuan', compact('paket_satus'));
    }

    // Mengubah Profil Pelanggan
    public function updateProfilPelanggan(Request $req)
    {
        $id = Auth::id();
        $users = User::find($id);
        $pelanggans = Pelanggan::select('pelanggans.*')
        ->where('kd_pelanggan', $users->kd_pengguna)
        ->first();
        $nama = $req->ubah_nama_pelanggan;
        $email = $req->ubah_email_pelanggan;
        $no_hp = $req->ubah_no_hp_pelanggan;
        $alamat = $req->ubah_alamat_pelanggan;
        if($req->ubah_foto_input == '' && $nama == $users->name && $email == $pelanggans->email_pelanggan && $no_hp == $pelanggans->no_hp_pelanggan && $alamat == $pelanggans->alamat_pelanggan){
            echo "gagal";
        }else{
            $avatar = $req->file('ubah_foto_input');
            if($avatar != '')
            {
                $users->avatar = $avatar->getClientOriginalName();
                $avatar->move(public_path('pictures/'), $avatar->getClientOriginalName());
            }
            if($nama != $users->name)
            {
                $users->name = $nama;
                $pelanggans->nama_pelanggan = $nama;
            }
            if($email != $pelanggans->email_pelanggan)
            {
                $pelanggans->email_pelanggan = $email;
            }
            if($no_hp != $pelanggans->no_hp_pelanggan)
            {
                $pelanggans->no_hp_pelanggan = $no_hp;
            }
            if($alamat != $pelanggans->alamat_pelanggan)
            {
                $pelanggans->alamat_pelanggan = $alamat;
            }
            $users->save();
            $pelanggans->save();
            echo "sukses";
        }
    }

    public function pesanSekarang($kodeProduk)
    {
        $maxKodeInvoice = Transaksi::max('kd_invoice') ?? 'I0000';
        $angka = intval(substr($maxKodeInvoice, 1));
        $angka++;
        $kodeInvoiceBaru = "I" . str_pad($angka, 4, '0', STR_PAD_LEFT);

        $paketTerpilih = Paket_kilo::where('kd_paket', $kodeProduk)->first();

        Checkout_kilo::create([
            'kd_invoice' => $kodeInvoiceBaru,
            'kd_paket'  => $kodeProduk,
            'berat_barang' => 1,
            'metode_pembayaran' => 'rumah',
            'harga_paket' => $paketTerpilih->harga_paket,
            'harga_antar' => 0,
            'harga_total' => $paketTerpilih->harga_paket,
        ]);

        $hari_ini = Carbon::now()->isoFormat('Y-M-D');

        Transaksi::create([
            'id_outlet' => $paketTerpilih->id_outlet,
            'kd_invoice' => $kodeInvoiceBaru,
            'kd_pelanggan'  => auth()->user()->kd_pengguna,
            'tgl_pemberian' => $hari_ini,
            'tgl_selesai' => $hari_ini,
            'status' => 'baru',
            'ket_bayar' => 'belum_dibayar',
            'kd_pegawai' => 'U0001'
        ]);

        Session::flash('pesananBerhasil', 'Pesanan Kamu Telah Berhasil, Silakan Tunggu Kedatangannya!');

        return redirect('/dashboard');
    }
}
