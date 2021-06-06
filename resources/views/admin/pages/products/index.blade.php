@extends('layouts.admin', ['title' => "Products"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <div class="row py-3 mb-3">
                <div class="col-6 d-flex align-items-center">
                    <h1 class="h3 mb-0">Sản Phẩm</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 my-2">
                    <div style="display: flex; justify-content: space-between">
                        <a href="{{ asset('be-admin/products/create') }}">
                            <button type="button" class="btn btn-primary">
                                Thêm
                            </button>
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
                                    <th style="width:25%;"></th>
                                    <th style="width:10%;">Mã Hàng</th>
                                    <th style="width:25%">Tên Hàng</th>
                                    <th style="width:10%">Hãng</th>
                                    <th style="width:25%">Giá</th>
                                    <th style="width:25%">Số Lượng</th>
                                    <th style="width:30%">Thời Gian</th>
                                    <th>Hàng Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($products) == 0)
                                    <tr>
                                        <td colspan="8" class="text-center">Không có sản phẩm nào.</td>
                                    </tr>
                                @endif
                                @foreach ($products as $product)
                                    <tr>
                                        <td><img style="width: 100%;"
                                                src="{{ asset('assets/images/' . $product->product_image) }}" alt=""></td>
                                        <td>{{ $product->product_id }}</td>
                                        <td><a
                                                href="{{ asset('products/' . $product->product_id) }}">{{ $product->product_name }}</a>
                                        </td>
                                        <td>{{ $product->manufacturer->manufacturer_name }}</td>
                                        <td>{{ number_format($product->product_price) }} VNĐ</td>
                                        <td>{{ $product->product_available }}</td>
                                        <td>{{ $product->created_at }}</td>
                                        <td class="table-action">
                                            <div class="d-flex">
                                                <a
                                                    href="{{ asset('be-admin/products/' . $product->product_id . '/edit') }}">
                                                    <button type="button" class="btn">
                                                        <i class=" align-middle" data-feather="edit-2"></i>
                                                    </button>
                                                </a>
                                                <form action="{{ asset('/be-admin/products/' . $product->product_id) }}"
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
                            @for ($i = 0; $i < $countAllProduct / $perPage; $i++)
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
