@extends('layouts.admin', ['title' => "Add Products"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <h1 class="h3 mb-3">Sửa Sản Phẩm</h1>
            <div class="row">
                <div class="col-12 col-6">
                    <div class="card px-5">
                        <div class="card-body">
                            <form action="{{ asset('be-admin/products/' . $product->product_id) }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                {{ method_field('PUT') }}
                                <div class="form-group">
                                    <label class="form-label">Tên</label>
                                    <input name="name" type="text" class="form-control" placeholder="Nhập tên..."
                                        value="{{ $product->product_name }}" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Hãng Sản Xuất</label>
                                    <select class="form-control" name="manufacturer" id="">
                                        @foreach ($manufacturers as $manufacturer)
                                            <option
                                                {{ $product->manufacturer->manufacturer_id == $manufacturer->manufacturer_id ? 'selected' : '' }}
                                                value="{{ $manufacturer->manufacturer_id }}">
                                                {{ $manufacturer->manufacturer_name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-4" style="height: 150px; overflow: auto">
                                    <label class="form-label">Loại Sản Phẩm</label>
                                    @foreach ($categories as $category)
                                        <div class="form-check my-2">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" name="categories[]" id=""
                                                    value="{{ $category->category_id }}" @foreach ($product->categories as $p_categories)  @if ($p_categories->category_id===$category->category_id)
                                                checked @endif
                                    @endforeach
                                    >
                                    {{ $category->category_name }}
                                    </label>
                                </div>
                                @endforeach
                        </div>
                        <div class="form-group">
                            <label class="form-label">Mô Tả</label>
                            <textarea name="description" class="form-control" placeholder="Nhập mô tả ở đây..."
                                rows="3">{{ $product->product_description }}</textarea>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Giá</label>
                            <input name="price" type="number" class="form-control" required
                                value="{{ $product->product_price }}">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Số lượng</label>
                            <input name="available" type="number" class="form-control" required
                                value="{{ $product->product_available }}">
                        </div>
                        <div class="form-group">
                            <label class="form-label w-100">Hình ảnh</label>
                            <input type="file" name="image" accept="image/*">
                            <small class="form-text text-muted">Chọn hình ảnh cho sản phẩm của bạn.</small>
                            <img style="width: 50%;" src="{{ asset('assets/images/' . $product->product_image) }}" alt="">
                        </div>
                        <button type="submit" class="btn btn-primary">Sửa Sản Phẩm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </main>
@endsection
