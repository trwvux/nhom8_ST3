<div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
    <div class="category" style="height: 390px;">
        <div class="ht__cat__thumb" style="height: 300px; display: flex; justify-content: center; align-items: center;">
            <a href="{{ asset('products/'.$product->product_id) }}" style="height: 100%; display: flex; align-items: center;"> 
                <img src="{{ asset('assets/images/'.$product->product_image) }}" alt="product images">
            </a>
        </div>
        <div class="fr__product__inner">
            <h4><a href="{{ asset('products/'.$product->product_id) }}">{{ $product->product_name }}</a></h4>
            <ul class="fr__pro__prize">
                <li>{{  number_format($product->product_price) }} VNĐ</li>
            </ul>
        </div>
    </div>
</div>