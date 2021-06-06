<tr>
    <td class="product-thumbnail"><a href="#">
            <img src="{{ asset('assets/images/' . $product->product_image) }}" alt="product img" /></a></td>
    <td class="product-name"><a href="{{ asset('products/' . $product->product_id) }}">
            {{ $product->product_name }}</a>
    </td>
    <td class="product-price">
        <span class="amount">{{ number_format($product->product_price) }} VNĐ</span>
    </td>
    <td class="product-quantity">
        <input type="number" value="{{ $product->product_quantity }}" disabled />
        <div style="margin-top: 10px">
            <a class="btn btn-primary" href="{{ asset('cart?increase=1&product=' . $product->product_id) }}" role="button">+</a>
            <a class="btn btn-primary" href="{{ asset('cart?decrease=1&product=' . $product->product_id) }}" role="button">--</a>
        </div>
    </td>
    <td class="product-subtotal">
        {{ number_format($product->product_price * $product->product_quantity) }} VNĐ</td>
    <td class="product-remove"><a href="{{ asset('cart?remove=true&product=' . $product->product_id) }}">
            <i class="icon-trash icons"></i></a></td>
</tr>
