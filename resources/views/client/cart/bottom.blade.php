<div class="row">
    <div class="col-md-6 col-sm-12 col-xs-12">
        @if (!session('.config_user'))
            <div style="display: flex; flex-direction: column; align-items: center">
                <h2 class="text-center" style="font-size: 1.5em">
                    Vui lòng đăng nhập để mua sản phẩm này.
                </h2>
                <div style="margin-top: 10px">
                    <a class="btn btn-primary" href="{{ asset('/sign-in') }}" role="button">
                        Đăng Nhập
                    </a>
                </div>
            </div>
        @endif
    </div>
    @php
        $totalPrice = 0;
        foreach ($cartProducts as $product) {
            $totalPrice += $product->product_price * $product->product_quantity;
        }
    @endphp
    <div class="col-md-6 col-sm-12 col-xs-12 smt-40 xmt-40">
        <div class="htc__cart__total">
            <h6>Tổng Giỏ Hàng</h6>
            <div class="cart__desk__list">
                <ul class="cart__desc">
                    <li>Tổng</li>
                    <li>Phí Giao Hàng</li>
                </ul>
                <ul class="cart__price">
                    <li>{{ number_format($totalPrice) }} VNĐ</li>
                    <li>Miễn Phí</li>
                </ul>
            </div>
            <div class="cart__total">
                <span>Tổng Đơn Đặt Hàng</span>
                <span>{{ number_format($totalPrice) }} VNĐ</span>
            </div>
            <ul class="payment__btn">
                @if (session('.config_user'))
                    <li class="active">
                        <form method="POST">
                            @csrf
                            <button type="submit" style="border: 0; width: 100%;">
                                <a>Mua Hàng Ngay</a>
                            </button>
                        </form>
                    </li>
                @endif
                <li><a href="{{ asset('products') }}">Tiếp tục mua sắm</a></li>
            </ul>
        </div>
    </div>
</div>
