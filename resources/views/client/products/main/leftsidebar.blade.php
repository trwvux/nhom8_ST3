<div class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
    <div class="htc__product__leftsidebar">
        <div class="htc__category" style="margin-top: 70px">
            <h4 class="title__line--4">Hãng sản xuất</h4>
            <ul class="ht__cat__list">
                @foreach ($manufacturers as $manufacturer)
                    <li><a href="{{ asset('/products?manufacturer=' . $manufacturer->manufacturer_id) }}">
                            {{ $manufacturer->manufacturer_name }}</a></li>
                @endforeach
            </ul>
        </div>
        <div class="htc__category">
            <h4 class="title__line--4">Danh mục</h4>
            <ul class="ht__cat__list">
                @foreach ($categories as $category)
                    <li><a href="{{ asset('/products?category=' . $category->category_id) }}">
                            {{ $category->category_name }}</a></li>
                @endforeach
            </ul>
        </div>
    </div>
</div>
