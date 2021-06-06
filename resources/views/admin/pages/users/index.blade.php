@extends('layouts.admin', ['title' => "Users"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <h1 class="h3 mb-3">Người Dùng</h1>
            <div class="row">
                <div class="col-12 my-2">
                    <div style="display: flex; justify-content: space-between">
                        <a href="{{ asset('/be-admin/users/create') }}">
                            <button type="button" class="btn btn-primary">Thêm</button>
                        </a>
                        <form class="form-inline d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                                <input style="background-color: #fff" name="search" type="text" class="form-control"
                                    placeholder="Tìm kiếm..." aria-label="Search"
                                    value="{{ request()->query('search') }}">
                                <div class="input-group-append">
                                    <button class="btn" type="submit" style="background-color: #fff">
                                        <i class="align-middle" data-feather="search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="width:20%;">Id</th>
                                    <th style="width:30%">Tài khoản</th>
                                    <th style="width:25%">Quyền Hạn</th>
                                    <th style="width:25%">Thời Gian</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($users) == 0)
                                    <tr>
                                        <td colspan="5" class="text-center">Không có người dùng nào.</td>
                                    </tr>
                                @endif
                                @foreach ($users as $user)
                                    <tr>
                                        <td>{{ $user->user_id }}</td>
                                        <td>{{ $user->user_username }}</td>
                                        <td>
                                            @if ($user->user_permission == '0')
                                                Quản trị viên
                                            @else
                                                Thành viên
                                            @endif
                                        </td>
                                        <td>{{ $user->created_at }}</td>
                                        <td class="table-action">
                                            <div class="d-flex align-items-center">
                                                <a href="{{ asset('/be-admin/users/' . $user->user_id . '/edit') }}">
                                                    <button type="button" class="btn">
                                                        <i class="align-middle" data-feather="edit-2"></i>
                                                    </button>
                                                </a>
                                                <form action="{{ asset('/be-admin/users/' . $user->user_id) }}"
                                                    method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="btn" type="submit"><i class="align-middle"
                                                            data-feather="trash"></i></button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12 d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            @php
                                $page = request()->query('page');
                                if (!$page) {
                                    $page = 1;
                                }
                            @endphp
                            @for ($i = 0; $i < $countAllUser / $perPage; $i++)
                                <li class="page-item {{ $page == $i + 1 ? 'active' : '' }}">
                                    <a class="page-link" href="{{ request()->fullUrlWithQuery(['page' => $i + 1]) }}">
                                        {{ $i + 1 }}
                                    </a>
                                </li>
                            @endfor
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </main>
@endsection
