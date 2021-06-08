@extends('layouts.auth', ['title' => 'Sign In'])

@section('content')
    <!-- <div class="wrap d-md-flex">
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
    </div> -->
    <div class="limiter">
		<div class="container-login100" style="background-image: url('auth/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <form class="signin-form" method="POST">
                     @csrf
					<span class="login100-form-title p-b-49">
						Đăng Nhập
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Tên Tài Khoản</span>
						<input class="input100" type="text" name="username" placeholder="Nhập tên tài khoản của bạn..." required>
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Mật Khẩu</span>
						<input class="input100" type="password" name="password" placeholder="Nhập mật khẩu của bạn..." required>
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
                    <br>
                    <br>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Đăng nhập
							</button>
						</div>
					</div>
					<div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17">
							Bạn chưa có tài khoản?
						</span>
						<a href="{{ asset('sign-up') }}" class="btn btn-white btn-outline-white">Đăng Ký</a>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection
