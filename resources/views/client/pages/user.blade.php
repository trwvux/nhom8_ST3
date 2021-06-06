@extends('layouts.client', ['title' => 'Cart'])

@section('content')
    <div class="cart-main-area ptb--100 bg__white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h2 style="margin-bottom: 20px">Đơn hàng -
                        {{ session('.config_user')->user_username }}.</h2>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h2 style="font-size: 17px; margin-bottom: 15px">
                        Sản phẩm bạn đã đặt hàng.</h2>
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Mã Đơn Hàng</th>
                                    <th class="product-name">Tên Sản Phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số Lượng</th>
                                    <th class="product-subtotal">Tổng Cộng</th>
                                    <th class="product-thumbnail">Tổng Tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orders as $order)
                                    @php
                                        if ($order->order_status == 1) {
                                            continue;
                                        }
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
                                            <td class="product-name">
                                                <img src="{{ asset('assets/images/' . $product->product_image) }}"
                                                    alt="product images" style="width: 100px; height: 100px"><br />
                                                <a href="{{ asset('products/' . $product->product_id) }}">
                                                    {{ $product->product_name }}</a>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">{{ number_format($product->product_price) }}
                                                    VNĐ</span>
                                            </td>
                                            <td class="product-quantity">
                                                <input type="number" value="{{ $detail->detail_quantity }}" disabled />
                                            </td>
                                            <td class="product-subtotal">
                                                {{ number_format($product->product_price * $detail->detail_quantity) }}
                                                VNĐ
                                            </td>
                                            @if ($index == 1)
                                                <td rowspan="{{ count($order->details) }}" class="product-subtotal">
                                                    {{ number_format($total) }}
                                                    VNĐ
                                                </td>
                                            @endif
                                        </tr>
                                    @endforeach
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h2 style="font-size: 17px; margin-bottom: 15px">
                        Sản phẩm chúng tôi đã giao cho bạn.</h2>
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Mã Đơn Hàng</th>
                                    <th class="product-name">Tên Sản Phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số Lượng</th>
                                    <th class="product-subtotal">Tổng Cộng</th>
                                    <th class="product-thumbnail">Tổng Tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orders as $order)
                                    @php
                                        if ($order->order_status == 0) {
                                            continue;
                                        }
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
                                            <td class="product-name">
                                                <img src="{{ asset('assets/images/' . $product->product_image) }}"
                                                    alt="product images" style="width: 100px; height: 100px"><br />
                                                <a href="{{ asset('products/' . $product->product_id) }}">
                                                    {{ $product->product_name }}</a>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">{{ number_format($product->product_price) }}
                                                    VNĐ</span>
                                            </td>
                                            <td class="product-quantity">
                                                <input type="number" value="{{ $detail->detail_quantity }}" disabled />
                                            </td>
                                            <td class="product-subtotal">
                                                {{ number_format($product->product_price * $detail->detail_quantity) }}
                                                VNĐ
                                            </td>
                                            @if ($index == 1)
                                                <td rowspan="{{ count($order->details) }}" class="product-subtotal">
                                                    {{ number_format($total) }}
                                                    VNĐ
                                                </td>
                                            @endif
                                        </tr>
                                    @endforeach
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
