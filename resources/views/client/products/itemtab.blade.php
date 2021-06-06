<!-- Start List Product -->
<div class="ht__list__product">
    <div class="ht__list__thumb" style="width: 300px;">
        <a href="{{ asset('products/'.$product->product_id) }}"><img src="{{ asset('assets/images/'.$product->product_image) }}"
                alt="product images"></a>
    </div>
    <div class="htc__list__details">
        <h2><a href="{{ asset('products/'.$product->product_id) }}">{{ $product->product_name }}</a></h2>
        <ul class="pro__prize">
            <li>{{  number_format($product->product_price) }} VNĐ</li>
        </ul>
        <p>{{ substr($product->product_description, 0, 150) }}...</p>
        <div class="fr__list__btn">
            <a class="fr__btn" href="{{ asset("cart?increase=1&product=". $product->product_id) }}">Thêm Vào Giỏ Hàng</a>
        </div>
    </div>
</div>
<!-- End List Product -->