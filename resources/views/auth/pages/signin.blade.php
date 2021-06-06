@extends('layouts.auth', ['title' => 'Sign In'])

@section('content')
    <div class="wrap d-md-flex">
        <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
            <div class="text w-100">
                <h2>Đăng nhập vào tài khoản của bạn</h2>
                <p>Bạn chưa có tài khoản?</p>
                <a href="{{ asset('sign-up') }}" class="btn btn-white btn-outline-white">Đăng Ký</a>
            </div>
        </div>
        <div class="login-wrap p-4 p-lg-5">
            <div class="d-flex">
                <div class="w-100">
                    <h3 class="mb-4">Đăng Nhập</h3>
                </div>
            </div>
            <form class="signin-form" method="POST">
                @csrf
                 <div class="form-group mb-3">
                    <label class="label" for="name">Tên tài khoản</label>
                    <input name="username" type="text" class="form-control" placeholder="Username" required>
                </div>
                <div class="form-group mb-3">
                    <label class="label" for="password">Mật khẩu</label>
                    <input name="password" type="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="form-control btn btn-primary submit px-3">Đăng Nhập</button>
                </div>
            </form>
        </div>
    </div>
@endsection
