@php
if (!isset($rating)) {
    $rating = 0;
}
if (!isset($noRating)) {
    $noRating = false;
}
@endphp

@if (!$noRating)
    <ul class="rating">
        @for ($i = 0; $i < $rating; $i++)
            <li><i class="icon-star icons"></i></li>
        @endfor
        @for ($i = 0; $i < 5 - $rating; $i++)
            <li class="old"><i class="icon-star icons"></i></li>
        @endfor
    </ul>
@endif
