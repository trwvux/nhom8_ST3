<!-- Start Pagenation -->
<div class="row">
    <div class="col-xs-12">
        @php
            $page = request()->query('page');
            if (!$page) {
                $page = 1;
            }
        @endphp
        <ul class="htc__pagenation">
            @for ($i = 0; $i < $countAllProduct / $perPage; $i++)
                <li class="{{ $page == $i + 1 ? 'active' : '' }}">
                    <a href="{{ request()->fullUrlWithQuery(['page' => $i + 1]) }}">
                        {{ $i + 1 }}
                    </a>
                </li>
            @endfor
        </ul>
    </div>
</div>
<!-- End Pagenation -->
