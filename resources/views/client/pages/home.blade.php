@extends('layouts.client', ['layout' => 'home', 'title' => 'Home'])

@section('content')
    @include('client.home.slider')
    <section class="htc__category__area ptb--100">
        <div class="container">

            @include('client.home.titlecategory',[
            'title' => 'Sản Phẩm Mới',
            'slogan' => 'Không thể bỏ qua nếu bạn là một tín đồ của âm nhạc'])

            <div class="htc__product__container">
                <div class="row">
                    <div class="product__list clearfix mt--30">
                        @foreach ($productsNew as $product)
                            @include('client.products.item', ['product' => $product])
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>

    @include('client.home.testimonial')

    <section class="ftr__product__area ptb--100">
        <div class="container">

            @include('client.home.titlecategory', [
            'title' => 'Bán Chạy Nhất',
            'slogan' => 'Khám phá những sản phẩm bán chạy nhất của chúng tôi.' ])

            <div class="row">
                <div class="product__wrap clearfix">
                    @foreach ($productBestSeller as $product)
                        @include('client.products.item', ['product' => $product])
                    @endforeach
                </div>
            </div>
        </div>
    </section>

    @include('client.common.brand')
@endsection
