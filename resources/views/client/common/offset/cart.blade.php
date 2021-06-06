<div class="shopping__cart">
    <div class="shopping__cart__inner">
        <div class="offsetmenu__close__btn">
            <a href="#"><i class="zmdi zmdi-close"></i></a>
        </div>
        <div class="shp__cart__wrap">
            @if (count($cartProducts) === 0)
                <h3 style="margin-bottom: 10px">Chưa có sản phẩm nào.</h3>
            @endif
            @foreach ($cartProducts as $product)
                <div class="shp__single__product">
                    <div class="shp__pro__thumb">
                        <a href="{{ asset('products/' . $product->product_id) }}">
                            <img src="{{ asset('assets/images/' . $product->product_image) }}" alt="product images">
                        </a>
                    </div>
                    <div class="shp__pro__details">
                        <h2><a href="{{ asset('products/' . $product->product_id) }}">
                                {{ $product->product_name }}</a></h2>
                        <span class="quantity">SL: {{ $product->product_quantity }}</span>
                        <span class="shp__price">
                            {{ number_format($product->product_price * $product->product_quantity) }} VNĐ</span>
                    </div>
                    <div class="remove__btn">
                        <a href="{{ asset('cart?remove=true&product=' . $product->product_id) }}"
                            title="Remove this item"><i class="zmdi zmdi-close"></i></a>
                    </div>
                </div>
            @endforeach
        </div>
        @php
            $totalPrice = 0;
            foreach ($cartProducts as $product) {
                $totalPrice += $product->product_price * $product->product_quantity;
            }
        @endphp
        <ul class="shoping__total">
            <li class="subtotal">Tổng:</li>
            <li class="total__price">{{ number_format($totalPrice) }} VNĐ</li>
        </ul>
        <ul class="shopping__btn">
            <li class="shp__checkout"><a href="{{ asset('cart') }}">Xem Giỏ Hàng</a></li>
        </ul>
    </div>
</div>
