<div class="ht__pro__desc">
    <div class="sin__desc">
        <p><span>Kho: </span> {{ $product->product_available }}</p>
    </div>
    <div class="sin__desc align--left">
        <p><span>Hãng sản xuất:</span> {{ $product->manufacturer->manufacturer_name }}</p>
    </div>
    <div class="sin__desc align--left">
        <p><span>Danh mục:</span></p> {{ $product->categories->category_name }}
    </div>
    <div class="fr__list__btn" style="margin-top: 15px">
        <a href="{{ asset("cart?increase=1&product=". $product->product_id) }}">
            <button class="fr__btn" style="border: 0">Thêm Vào Giỏ Hàng</button>
        </a>
    </div>
</div>
