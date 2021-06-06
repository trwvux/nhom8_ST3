@extends('layouts.auth', ['title' => 'Sign Up'])

@section('content')
    <div class="wrap d-md-flex">
        <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
            <div class="text w-100">
                <h2>Đăng ký một tài khoản</h2>
                <p>Bạn đã có một tài khoản?</p>
                <a href="{{ asset('sign-in') }}" class="btn btn-white btn-outline-white">Đăng Nhập</a>
            </div>
        </div>
        <div class="login-wrap p-4 p-lg-5">
            <div class="d-flex">
                <div class="w-100">
                    <h3 class="mb-4">Đăng Ký</h3>
                </div>
            </div>
            <form class="signin-form" method="POST">
                @csrf
                <div class="form-group mb-3">
                    <label class="label" for="name">Email</label>
                    <input name="email" type="email" class="form-control" placeholder="Email" required>
                </div>
                <div class="form-group mb-3">
                    <label class="label" for="name">Tên tài khoản</label>
                    <input name="username" type="text" class="form-control" placeholder="Username" required>
                </div>
                <div class="form-group mb-3">
                    <label class="label" for="password">Mật khẩu</label>
                    <input name="password" type="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group mb-3">
                    <label class="label" for="password">Nhập lại mật khẩu</label>
                    <input name="repassword" type="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="form-control btn btn-primary submit px-3">Đăng Ký</button>
                </div>
            </form>
        </div>
    </div>
@endsection
