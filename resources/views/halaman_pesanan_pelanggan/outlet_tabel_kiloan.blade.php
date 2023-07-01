@foreach ($paket_kilos as $paket_kilo)
    <div class="list-group-item flex-column align-items-start">
        <div class="d-flex w-100 justify-content-start">
            <h5 class="mb-2">{{ $paket_kilo->nama_paket }}</h5>
        </div>
        <div class="row">
            <div class="col-md-6">
                <table style="width: 100%;" class="tabel-paket">
                    <tr>
                        <td>Harga Paket</td>
                        <td>:</td>
                        <td>Rp. {{ number_format($paket_kilo->harga_paket, 2, ',', '.') }}</td>
                    </tr>
                    <tr>
                        <td>Minimal Pesanan</td>
                        <td>:</td>
                        <td>{{ $paket_kilo->min_berat_paket }} Galon</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6">
                @if ($paket_kilo->antar_jemput_paket == 1)
                    <div
                         style="background-color: #fff; border: 1px solid #0077b6; height: 70px; line-height: 70px; border-radius: 7px;">
                        <a href="{{ route('pesan_sekarang', $paket_kilo->kd_paket) }}">
                            <div class="text-dark font-weight-bold text-center">
                                <p style="font-size: 16px;"><i class="icon-check text-success"></i> Pesan Sekarang
                                </p>
                            </div>
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endforeach
