<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Safaqua</title>
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('icons/pratama_icon.png') }}">
    <link href="{{ asset('plugins/sweetalert/css/sweetalert.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>

<body class="h-100">
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
                        stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <div class="login-form-bg h-100">
        <div class="h-100 container">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <div class="text-center">
                                    <h4>Registrasi Akun Member</h4>
                                </div>
                                <form method="POST" action="{{ route('registrasi_member') }}" class="mt-5 mb-5"
                                      name="form_register" enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group">
                                        <input type="text" name="nama" class="form-control"
                                               placeholder="Nama">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control"
                                               placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="email_pelanggan" class="form-control"
                                               placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <input type="tel" name="no_hp_pelanggan" class="form-control"
                                               placeholder="Nomor Handphone">
                                    </div>
                                    <div class="form-group">
                                        <div style="margin-bottom: -10px;">
                                            <p class="font-weight-bold text-dark">Jenis Kelamin : </p>
                                        </div>
                                        <label class="radio-inline mr-3">
                                            <input type="radio" name="jk_pelanggan" value="L"> Laki-laki</label>
                                        <label class="radio-inline">
                                            <input type="radio" name="jk_pelanggan" value="P"> Perempuan</label>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control pilih_outlet" name="pilih_outlet">
                                            <option value="" class="outlet_kosong">-- Pilih Outlet --</option>
                                            @foreach ($outlets as $outlet)
                                                <option value="{{ $outlet->id }}">{{ $outlet->nama }}</option>
                                            @endforeach
                                        </select>
                                        <div class="pilih_outlet_error"></div>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control"
                                               placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control h-150" rows="5" id="comment" placeholder="Alamat" name="alamat_pelanggan"></textarea>
                                    </div>
                                    <button class="btn login-form__btn submit w-100">Buat Akun</button>
                                </form>
                                <a href="{{ route('login') }}"
                                   class="btn login-form__btn submit w-100">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="{{ asset('plugins/common/common.min.js') }}"></script>
    <script src="{{ asset('js/custom.min.js') }}"></script>
    <script src="{{ asset('js/settings.js') }}"></script>
    <script src="{{ asset('js/gleek.js') }}"></script>
    <script src="{{ asset('js/styleSwitcher.js') }}"></script>
    <script src="{{ asset('js/jquery.form-validator.min.js') }}"></script>
    <script src="{{ asset('plugins/sweetalert/js/sweetalert.min.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('focus', ':input', function() {
                $(this).attr('autocomplete', 'off');
            });
        });

        $(document).on('change', '.pilih_outlet', function() {
            if ($(this).val() == "") {
                $('#daftar_paket_kiloan').html('');
                $('#daftar_paket_satuan').html('');
            } else {
                var sort_by = $(this).val();
                $.ajax({
                    url: "{{ url('sort_outlet_tabel_kiloan') }}/" + sort_by,
                    success: function(data) {
                        $('#daftar_paket_kiloan').html(data);
                    }
                });
                $.ajax({
                    url: "{{ url('sort_outlet_tabel_satuan') }}/" + sort_by,
                    success: function(data) {
                        $('#daftar_paket_satuan').html(data);
                    }
                });
            }
        });

        $(function() {
            $("form[name='form_register']").validate({
                rules: {
                    nama: "required",
                    no_hp_pelanggan: {
                        required: true,
                        minlength: 12
                    },
                    jk_pelanggan: "required",
                    email_pelanggan: {
                        required: true,
                        email: true
                    },
                    alamat_pelanggan: {
                        required: true,
                        minlength: 15
                    },
                    pilih_outlet: "required",
                    username: {
                        required: true,
                        minlength: 3
                    },
                    password: {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    nama: "<span style='color: red;'>Nama tidak boleh kosong</span>",
                    username: "<span style='color: red;'>Username tidak boleh kosong</span>",
                    password: "<span style='color: red;'>Password tidak boleh kosong</span>",
                    nama_pelanggan: "<span style='color: red;'>Nama tidak boleh kosong</span>",
                    no_hp_pelanggan: "<span style='color: red;'>No Handphone tidak boleh kosong</span>",
                    jk_pelanggan: "<span style='color: red;'>Silakan pilih jenis kelamin</span>",
                    email_pelanggan: "<span style='color: red;'>Email tidak boleh kosong</span>",
                    alamat_pelanggan: {
                        required: "<span style='color: red;'>Alamat tidak boleh kosong</span>",
                        minlength: "<span style='color: red;'>Alamat harus lebih dari 15 karakter</span>"
                    },
                    pilih_outlet: "<span style='color: red;'>Pilih outlet terlebih dahulu</span>",
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
        });

        $('.avatar-input').change(function() {
            $(this).next('label').text($(this).val());
        });

        @if ($message = Session::get('tersimpan'))
            swal(
                "Berhasil!",
                "{{ $message }}",
                "success"
            )
        @endif

        @if ($message = Session::get('usernameError'))
            swal(
                "Gagal!",
                "{{ $message }}",
                "error"
            )
        @endif

        @if ($message = Session::get('emailError'))
            swal(
                "Gagal!",
                "{{ $message }}",
                "error"
            )
        @endif

        @if ($message = Session::get('noHpError'))
            swal(
                "Gagal!",
                "{{ $message }}",
                "error"
            )
        @endif
    </script>
</body>

</html>
