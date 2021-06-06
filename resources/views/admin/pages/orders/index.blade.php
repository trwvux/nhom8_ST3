@extends('layouts.admin', ['title' => "Products"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <div class="row py-3 mb-3">
                <div class="col-6">
                    <h1 class="h3 mb-3">Đơn Đặt Hàng</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div style="margin-bottom: 20px">
                        <div class="form-group" style="width: 200px">
                            <label for="">Hiển Thị:</label>
                            @php
                                $status = request()->query('status');
                                if (!$status === '') {
                                    $status = '';
                                }
                            @endphp
                            <select class="form-control" onchange="window.location.href=this.value">
                                <option value="{{ request()->fullUrlWithQuery(['status' => '']) }}" @if ($status == '') selected @endif>Tất
                                    Cả</option>
                                <option value="{{ request()->fullUrlWithQuery(['status' => '1']) }}" @if ($status == '1') selected @endif>Sản Phẩm Đã Giao
                                </option>
                                <option value="{{ request()->fullUrlWithQuery(['status' => '0']) }}" @if ($status == '0') selected @endif>Sản Phẩm Đang Xử Lý
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="card">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="width:10%;">Mã Đơn</th>
                                    <th style="width:30%;">Sản Phẩm</th>
                                    <th style="width:10%;">Số Lượng</th>
                                    <th style="width:20%;">Tổng Tiền</th>
                                    <th style="width:20%;">Tổng Cộng</th>
                                    <th style="width:10%;">Người Mua</th>
                                    <th style="width:20%">Trạng Thái</th>
                                    <th style="width:15%">Thời Gian</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($orders) == 0)
                                    <tr>
                                        <td colspan="9" class="text-center">Không có đơn hàng nào.</td>
                                    </tr>
                                @endif
                                @foreach ($orders as $order)
                                    @php
                                        $index = 0;
                                        $total = 0;
                                        foreach ($order->details as $detail) {
                                            $product = $detail->product;
                                            $total += $product->product_price * $detail->detail_quantity;
                                        }
                                    @endphp
                                    @foreach ($order->details as $detail)
                                        @php
                                            $index += 1;
                                            $product = $detail->product;
                                        @endphp
                                        <tr>
                                            @if ($index == 1)
                                                <td rowspan="{{ count($order->details) }}" class="product-thumbnail">
                                                    {{ $order->order_id }}</td>
                                            @endif
                                            <td>
                                                <a href="{{ asset('products/' . $product->product_id) }}">
                                                    {{ $product->product_name }}</a>
                                            </td>
                                            <td>
                                                {{ $detail->detail_quantity }}
                                            </td>
                                            <td>
                                                <span
                                                    class="amount">{{ number_format($product->product_price * $detail->detail_quantity) }}
                                                    VNĐ</span>
                                            </td>
                                            @if ($index == 1)
                                                <td rowspan="{{ count($order->details) }}">
                                                    {{ number_format($total) }} VNĐ
                                                </td>
                                                <td rowspan="{{ count($order->details) }}">
                                                    {{ $order->user->user_username }}
                                                </td>
                                                <td rowspan="{{ count($order->details) }}">
                                                    {{ $order->order_status === 0 ? 'Đang xử lý' : 'Đã giao hàng' }}
                                                </td>
                                                <td rowspan="{{ count($order->details) }}">{{ $order->created_at }}
                                                </td>
                                                <td rowspan="{{ count($order->details) }}" class="table-action">
                                                    <div class="d-flex">
                                                        @if ($order->order_status === 0)
                                                            <form
                                                                action="{{ asset('/be-admin/orders/' . $order->order_id) }}"
                                                                method="POST">
                                                                @csrf
                                                                {{ method_field('PUT') }}
                                                                <button class="btn" type="submit"><i class="align-middle"
                                                                        data-feather="check"></i></button>
                                                            </form>
                                                        @endif
                                                        <form
                                                            action="{{ asset('/be-admin/orders/' . $order->order_id) }}"
                                                            method="POST">
                                                            @csrf
                                                            {{ method_field('DELETE') }}
                                                            <button class="btn" type="submit"><i class="align-middle"
                                                                    data-feather="trash"></i></button>
                                                        </form>
                                                    </div>
                                                </td>
                                            @endif
                                        </tr>
                                    @endforeach
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
                            @for ($i = 0; $i < $countAllOrder / $perPage; $i++)
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
