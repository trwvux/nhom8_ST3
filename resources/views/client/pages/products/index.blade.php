@php
$title = 'Tất Cả Sản Phẩm';
if (request()->query('search')) {
    $title = 'Tìm Kiếm - ' . request()->query('search');
}
if (request()->query('manufacturer')) {
    $title = $nameManufacturer;
}
if (request()->query('category')) {
    $title = $nameCategory;
}
@endphp


@extends('layouts.client', ['title' => $title])

@section('content')
    <section class="htc__product__grid bg__white ptb--100">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12">
                    <div class="htc__product__rightidebar">
                        @include('client.products.main.gridtop')
                        <!-- Start Product View -->
                        <div class="row">
                            <div class="shop__grid__view__wrap">
                                <div role="tabpanel" id="grid-view"
                                    class="single-grid-view tab-pane fade in active clearfix">
                                    @foreach ($products as $product)
                                        @include('client.products.item', ['product' => $product])
                                    @endforeach
                                </div>
                                <div role="tabpanel" id="list-view" class="single-grid-view tab-pane fade clearfix">
                                    <div class="col-xs-12">
                                        <div class="ht__list__wrap">
                                            @foreach ($products as $product)
                                                @include('client.products.itemtab', ['product' => $product])
                                            @endforeach
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End Product View -->
                    </div>
                    @include('client.products.main.pagination')
                </div>
                @include('client.products.main.leftsidebar')
            </div>
        </div>
    </section>
@endsection
