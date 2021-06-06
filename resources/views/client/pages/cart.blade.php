@extends('layouts.client', ['title' => 'Cart'])

@section('content')
    <div class="cart-main-area ptb--100 bg__white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h2 style="font-size: 17px; margin-bottom: 15px">
                        Giỏ hàng của bạn có {{ count($cartProducts) }} sản phẩm.</h2>
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Sản Phẩm</th>
                                    <th class="product-name">Tên Sản Phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số Lượng</th>
                                    <th class="product-subtotal">Tổng Cộng</th>
                                    <th class="product-remove">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($cartProducts) == 0)
                                    <tr>
                                        <td colspan="6">Không có sản phẩm nào.</td>
                                    </tr>
                                @endif
                                @foreach ($cartProducts as $product)
                                    @include('client.cart.item', ['product' => $product])
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    @include('client.cart.bottom')
                </div>
            </div>
        </div>
    </div>
@endsection
