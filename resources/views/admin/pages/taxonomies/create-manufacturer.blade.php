@extends('layouts.admin', ['title' => "Products"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <h1 class="h3 mb-3">Thêm Hãng Sản Xuất</h1>
            <div class="row">
                <div class="col-12 col-6">
                    <div class="card px-5">
                        <div class="card-body">
                            <form action="{{ asset('be-admin/taxonomies') }}" method="POST">
                                @csrf
                                <input type="text" name="type" value="manufacturer" style="display: none">
                                <div class="form-group">
                                    <label class="form-label">Tên Hãng Sản Xuất</label>
                                    <input name="name" type="text" class="form-control" placeholder="Nhập tên..." required>
                                </div>
                                <button type="submit" class="btn btn-primary">Tạo Mới</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
