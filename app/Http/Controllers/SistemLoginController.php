<?php

namespace App\Http\Controllers;

use App\Outlet;
use App\Pelanggan;
use Auth;
use Session;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class SistemLoginController extends Controller
{
    // Membuka Halaman Login
    public function halamanLogin()
    {
        $penggunas = User::all();
    	return view('halaman_login', compact('penggunas'));
    }

    // Verifikasi Login
    public function verifikasiLogin(Request $request)
    {
    	if(Auth::attempt($request->only('username', 'password')))
    	{
    		return redirect('/dashboard');
    	}
        Session::flash('gagal_login', 'Maaf username atau password anda salah');
    	return redirect('/login');
    }

    // Proses Logout
    public function prosesLogout()
    {
    	Auth::logout();
    	return redirect('/login');
    }

    // Registrasi Awal
    public function registrasiAwal(Request $req)
    {
        if($req->avatar != "")
        {
            $penggunas = new User;
            $penggunas->kd_pengguna = "U0001";
            $penggunas->name = $req->nama;
            $penggunas->role = "admin";
            $penggunas->username = $req->username;
            $penggunas->password = Hash::make($req->password);
            $penggunas->remember_token = Str::random(60);
            $avatar = $req->file('avatar');
            $penggunas->avatar = $avatar->getClientOriginalName();
            $avatar->move(public_path('pictures/'), $avatar->getClientOriginalName());
            $penggunas->save();
            Session::flash('tersimpan', 'Registrasi Berhasil');
            return redirect('/login');
        }else{
            $penggunas = new User;
            $penggunas->kd_pengguna = "U0001";
            $penggunas->name = $req->nama;
            $penggunas->role = "admin";
            $penggunas->avatar = "default.png";
            $penggunas->username = $req->username;
            $penggunas->password = Hash::make($req->password);
            $penggunas->remember_token = Str::random(60);
            $penggunas->save();
            Session::flash('tersimpan', 'Registrasi Berhasil');
            return redirect('/login');
        }
    }
    

    public function halamanRegistrasi()
    {
        $outlets = Outlet::all();
        return view('halaman_registrasi', compact('outlets'));
    }

    public function registrasiMember(Request $request)
    {
        $cek_username = User::where('username', '=', $request->username)
    	->count();
        $cek_email = Pelanggan::where('email_pelanggan', '=', $request->email_pelanggan)
    	->count();
        $cek_no_hp = Pelanggan::where('no_hp_pelanggan', '=', $request->email)
    	->count();

        if($cek_username == 1) {
            Session::flash('usernameError', 'Username sudah digunakan orang lain');
            return redirect('/register');
        }

        if($cek_email == 1) {
            Session::flash('emailError', 'Email sudah digunakan orang lain');
            return redirect('/register');
        }

        if($cek_no_hp == 1) {
            Session::flash('noHpError', 'Nomor HP sudah digunakan orang lain');
            return redirect('/register');
        }

        $maxKodePelanggan = Pelanggan::max('kd_pelanggan') ?? 'K0000';
        $angka = intval(substr($maxKodePelanggan, 1));
        $angka++;
        $kodePelangganBaru = "K" . str_pad($angka, 4, '0', STR_PAD_LEFT);

        $newUser = User::create([
            'kd_pengguna' => $kodePelangganBaru,
            'name' => $request->nama,
            'role' => 'member',
            'avatar' => 'default.png',
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'id_outlet' => $request->pilih_outlet,
        ]);

        Pelanggan::create([
            'kd_pelanggan' => $kodePelangganBaru,
            'nama_pelanggan' => $request->nama,
            'jk_pelanggan' => $request->jk_pelanggan,
            'email_pelanggan' => $request->email_pelanggan,
            'no_hp_pelanggan' => $request->no_hp_pelanggan,
            'alamat_pelanggan' => $request->alamat_pelanggan,
            'cek_member' => 'member',
            'password' => $request->password,
        ]);

        Session::flash('tersimpan', 'Registrasi Berhasil');
        return redirect('/login');
    }
}
