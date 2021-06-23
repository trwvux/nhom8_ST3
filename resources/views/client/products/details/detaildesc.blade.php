<div class="ht__pro__desc">
    <div class="sin__desc">
        <h6>Kho: {{ $product->product_available }}</h6>
    </div>
    <div class="sin__desc">
        <h6>Hãng sản xuất: {{ $product->manufacturer->manufacturer_name }}</h6> 
    </div>
    <div class="sin__desc ">
        <h6>Danh mục:   {{ $product->categories->category_name }} </h6>
    </div>
    <div class="fr__list__btn" style="margin-top: 15px">
        <a href="{{ asset("cart?increase=1&product=". $product->product_id) }}">
            <button class="fr__btn" style="border: 0">Thêm Vào Giỏ Hàng</button>
        </a>
    </div>
</div>
