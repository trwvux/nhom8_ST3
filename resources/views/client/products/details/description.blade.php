<!-- Start Product Description -->
<style>
    .icon-select {
        cursor: pointer;
    }

</style>
<section class="htc__produc__decription bg__white">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <!-- Start List And Grid View -->
                <ul class="pro__details__tab" role="tablist">
                    <li role="presentation" class="description active"><a href="#description" role="tab"
                            data-toggle="tab">Mô Tả</a></li>
                    <li role="presentation" class="review"><a href="#review" role="tab" data-toggle="tab">Bình Luận</a>
                    </li>
                    <li role="presentation" class="shipping"><a href="#shipping" role="tab" data-toggle="tab">Đánh
                            Giá</a></li>
                </ul>
                <!-- End List And Grid View -->
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="ht__pro__details__content">
                    <div role="tabpanel" id="description" class="pro__single__content tab-pane fade in active">
                        <div class="pro__tab__content__inner">
                            {{ $product->product_description }}
                        </div>
                    </div>
                    <div role="tabpanel" id="review" class="pro__single__content tab-pane fade">
                        <div class="pro__tab__content__inner">
                            <div class="container" style="margin-top: 40px">
                                <div class="row">
                                    <div class="col-md-7" style="margin-bottom: 4em">
                                        @if (count($comments) == 0)
                                            <h2 class="text-center" style="font-size: 1.5em">
                                                Chưa có bình luận nào cho sản phẩm này.
                                            </h2>
                                        @endif
                                        @foreach ($comments as $comment)
                                            @if ($comment->comment_rating == -1)
                                                <div class="testimonial" style="margin-bottom: 30px">
                                                    <div class="testimonial__thumb" style="width: 20px">
                                                        <img src="{{ asset('assets/profile.png') }}"
                                                            alt="testimonial images">
                                                    </div>
                                                    <div class="testimonial__details">
                                                        <p>{{ $comment->created_at }}</p>
                                                        @include('client.products.details.rating', ['noRating' => true])
                                                        <h4><a href="#">{{ $comment->user->user_username }}</a></h4>
                                                        <p>{{ $comment->comment_content }}</p>
                                                    </div>
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                    <div class="col-md-5">
                                        @if (!session('.config_user'))
                                            <div style="display: flex; flex-direction: column; align-items: center">
                                                <h2 class="text-center" style="font-size: 1.5em">
                                                    Vui lòng đăng nhập để bình luận sản phẩm.
                                                </h2>
                                                <div style="margin-top: 10px">
                                                    <a class="btn btn-primary" href="{{ asset('/sign-in') }}"
                                                        role="button">
                                                        Đăng Nhập
                                                    </a>
                                                </div>
                                            </div>
                                        @else
                                            <form action="{{ asset('be-admin/comments') }}" method="post">
                                                @csrf
                                                <div class="form-group">
                                                    <label for="" style="font-size: 18px">Bình Luận</label>
                                                    <input name="product" type="text"
                                                        value="{{ $product->product_id }}" style="display: none">
                                                    <textarea name="content" class="form-control" rows="3"
                                                        placeholder="Nhập chi tiết đánh giá của bạn về sản phẩm..."
                                                        required></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Gửi bình luận</button>
                                            </form>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" id="shipping" class="pro__single__content tab-pane fade">
                        <div class="pro__tab__content__inner">
                            <div class="container" style="margin-top: 40px">
                                <div class="row">
                                    <div class="col-md-7" style="margin-bottom: 4em">
                                        @if (count($comments) == 0)
                                            <h2 class="text-center" style="font-size: 1.5em">
                                                Chưa có đánh giá nào cho sản phẩm này.
                                            </h2>
                                        @endif
                                        @foreach ($comments as $comment)
                                            @if ($comment->comment_rating != -1)
                                                <div class="testimonial" style="margin-bottom: 30px">
                                                    <div class="testimonial__thumb" style="width: 20px">
                                                        <img src="{{ asset('assets/profile.png') }}"
                                                            alt="testimonial images">
                                                    </div>
                                                    <div class="testimonial__details">
                                                        <p>{{ $comment->created_at }}</p>
                                                        @include('client.products.details.rating', ['rating' =>
                                                        $comment->comment_rating ])
                                                        <h4><a href="#">{{ $comment->user->user_username }}</a></h4>
                                                        <p>{{ $comment->comment_content }}</p>
                                                    </div>
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                    <div class="col-md-5">
                                        @if (!session('.config_user'))
                                            <div style="display: flex; flex-direction: column; align-items: center">
                                                <h2 class="text-center" style="font-size: 1.5em">
                                                    Vui lòng đăng nhập để đánh giá sản phẩm.
                                                </h2>
                                                <div style="margin-top: 10px">
                                                    <a class="btn btn-primary" href="{{ asset('/sign-in') }}"
                                                        role="button">
                                                        Đăng Nhập
                                                    </a>
                                                </div>
                                            </div>
                                        @elseif (count($product->orders) === 0)
                                            <div style="display: flex; flex-direction: column; align-items: center">
                                                <h2 class="text-center" style="font-size: 1.5em">
                                                    Bạn phải mua sản phẩm để được đánh giá.
                                                </h2>
                                            </div>
                                        @elseif ($isRatingOnce)
                                            <div style="display: flex; flex-direction: column; align-items: center">
                                                <h2 class="text-center" style="font-size: 1.5em">
                                                    Bạn chỉ được đánh giá sản phẩm một lần. Bạn không thể đánh giá.
                                                </h2>
                                            </div>
                                        @else
                                            <form action="{{ asset('be-admin/comments') }}" method="post">
                                                @csrf
                                                <div class="form-group">
                                                    <label for="" style="font-size: 18px">Đánh Giá</label>
                                                    <ul class="rating">
                                                        <li class="icon-select"><i class="icon-star icons"></i></li>
                                                        <li class="icon-select"><i class="icon-star icons"></i></li>
                                                        <li class="icon-select"><i class="icon-star icons"></i></li>
                                                        <li class="icon-select"><i class="icon-star icons"></i></li>
                                                        <li class="icon-select"><i class="icon-star icons"></i></li>
                                                        <input name="rating" id="ratingInput" type="text" value="5"
                                                            style="display: none">
                                                    </ul>
                                                    <input name="product" type="text"
                                                        value="{{ $product->product_id }}" style="display: none">
                                                    <textarea name="content" class="form-control" rows="3"
                                                        placeholder="Nhập chi tiết đánh giá của bạn về sản phẩm..."
                                                        required></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
                                            </form>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        const iconSelect = document.querySelectorAll(".icon-select");
        const ratingInput = document.getElementById("ratingInput");
        for (let index = 0; index < iconSelect.length; index++) {
            iconSelect[index].addEventListener("click", () => {
                for (let jIndex = 0; jIndex <= index; jIndex++)
                    iconSelect[jIndex].classList.remove("old");
                for (let jIndex = index + 1; jIndex < iconSelect.length; jIndex++)
                    iconSelect[jIndex].classList.add("old");
                ratingInput.setAttribute("value", index + 1);
            })
        }

    </script>
</section>
<!-- End Product Description -->
