@extends('layouts.admin', ['title' => "Edit Users"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <h1 class="h3 mb-3">Sửa Người Dùng</h1>
            <div class="row">
                <div class="col-12 col-6">
                    <div class="card px-5">
                        <div class="card-body">
                            <form method="POST" action="{{ asset('be-admin/users/' . $user->user_id) }}">
                                @csrf
                                {{ method_field('PUT') }}
                                <div class="form-group">
                                    <label class="form-label">Tên tài khoản</label>
                                    <input name="username" type="text" class="form-control" placeholder="Nhập tên..."
                                        value="{{$user->user_username}}" disabled required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Mật khẩu</label>
                                    <input name="password" type="password" class="form-control" placeholder="Nhập mật khẩu..."
                                    value = "...">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Quyền Hạn</label>
                                    <select class="form-control" name="permission" id="" required>
                                        <option value="1" 
                                        @if($user->user_permission == '1')
                                        selected
                                        @endif
                                        >Thành viên</option>
                                        <option value="0" 
                                        @if($user->user_permission == '0')
                                        selected 
                                        @endif
                                        >Quản trị viên</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Sửa</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
