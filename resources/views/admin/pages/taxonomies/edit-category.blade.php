@extends('layouts.admin', ['title' => "Products"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">

            <h1 class="h3 mb-3">Sửa Chuyên Mục Sản Phẩm</h1>

            <div class="row">
                <div class="col-12 col-6">
                    <div class="card px-5">
                        <div class="card-body">
                            <form action="{{ asset('be-admin/taxonomies/'.$category->category_id) }}" method="POST">
                                @csrf
                                {{ method_field('PUT') }}
                                <input type="text" name="type" value="category" style="display: none">
                                <div class="form-group">
                                    <label class="form-label">Tên Chuyên Mục</label>
                                    <input name="name" type="text" class="form-control" placeholder="Nhập tên..." required 
                                    value="{{ $category->category_name }}">
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
