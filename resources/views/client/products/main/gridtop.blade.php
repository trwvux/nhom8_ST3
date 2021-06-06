<div class="text-center" style="font-size: 2em; font-weight: 800; margin-bottom: 2em">
    @if (request()->query('search'))
        Kết quả tìm kiếm cho "{{ request()->query('search') }}"
    @elseif (request()->query('manufacturer'))
        Hãng sản xuất: {{ $nameManufacturer }}
    @elseif (request()->query('category'))
        Chuyên mục: {{ $nameCategory }}
    @endif
</div>
<div class="htc__grid__top">
    <div class="htc__select__option">
        @if (!$customView)
            @php
                $sort = request()->query('sort');
                if (!$sort) {
                    $sort = 'default';
                }
            @endphp
            <select class="ht__select" onchange="window.location.href=this.value">
                <option value="{{ request()->fullUrlWithQuery(['sort' => 'default']) }}" @if ($sort == 'default') selected @endif>
                    Sắp xếp mặc định</option>
                <option value="{{ request()->fullUrlWithQuery(['sort' => 'nameAZ']) }}" @if ($sort == 'nameAZ') selected @endif>
                    Sắp xếp theo tên A-Z</option>
                <option value="{{ request()->fullUrlWithQuery(['sort' => 'nameZA']) }}" @if ($sort == 'nameZA') selected @endif>
                    Sắp xếp theo tên Z-A</option>
                <option value="{{ request()->fullUrlWithQuery(['sort' => 'priceSB']) }}" @if ($sort == 'priceSB') selected @endif>
                    Sắp xếp theo giá nhỏ - lớn</option>
                <option value="{{ request()->fullUrlWithQuery(['sort' => 'priceBS']) }}" @if ($sort == 'priceBS') selected @endif>
                    Sắp xếp theo giá lớn - nhỏ</option>
            </select>
        @endif
        @php
            $perPage = request()->query('perPage');
            if (!$perPage) {
                $perPage = 8;
            }
        @endphp
        <select class="ht__select" onchange="window.location.href=this.value">
            <option value="{{ request()->fullUrlWithQuery(['perPage' => $perPage]) }}">
                Hiển thị -- sản phẩm</option>
            <option value="{{ request()->fullUrlWithQuery(['perPage' => 8]) }}" @if ($perPage == 8) selected @endif>
                Hiển thị 08 sản phẩm</option>
            <option value="{{ request()->fullUrlWithQuery(['perPage' => 12]) }}" @if ($perPage == 12) selected @endif>
                Hiển thị 12 sản phẩm</option>
            <option value="{{ request()->fullUrlWithQuery(['perPage' => 16]) }}" @if ($perPage == 16) selected @endif>
                Hiển thị 16 sản phẩm</option>
            <option value="{{ request()->fullUrlWithQuery(['perPage' => 20]) }}" @if ($perPage == 20) selected @endif>
                Hiển thị 20 sản phẩm</option>
        </select>
    </div>
    @php
        $page = request()->query('page');
        if (!$page) {
            $page = 1;
        }
        $endCount = count($products) * $page;
    @endphp
    <div class="ht__pro__qun" style="display: flex; align-items: center;">
        @if (count($products) > 0)
            <span>Hiển thị {{ $endCount - count($products) + 1 }}-{{ $endCount }} trên
                {{ $countAllProduct }} sản phẩm</span>
        @else
            <span>Không có sản phẩm nào</span>
        @endif
    </div>

    <ul class="view__mode" role="tablist">
        <li role="presentation" class="grid-view active"><a href="#grid-view" role="tab" data-toggle="tab"><i
                    class="zmdi zmdi-grid"></i></a></li>
        <li role="presentation" class="list-view"><a href="#list-view" role="tab" data-toggle="tab"><i
                    class="zmdi zmdi-view-list"></i></a></li>
    </ul>
</div>
