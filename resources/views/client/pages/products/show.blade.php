@extends('layouts.client', ['title' => $product->product_name ])

@section('content')
    @include('client.products.details.index')
    @include('client.products.details.description')

    <section class="htc__category__area ptb--100">
        <div class="container">
            @include('client.home.titlecategory',[ 'title' => 'Sản Phẩm Liên Quan', 'slogan' => 'Bạn muốn tìm những thứ phù
            hợp hơn? Lựa chọn ngay.'])
            <div class="htc__product__container">
                <div class="row">
                    <div class="product__list clearfix mt--30">
                        @foreach ($productsRelated as $product)
                            @include('client.products.item', ['product' => $product])
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
