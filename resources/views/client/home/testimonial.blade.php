<section class="htc__testimonial__area bg__cat--4">
    <div class="container">
        <div class="row">
            <div class="ht__testimonial__activation clearfix">
                @foreach ($newComments as $comment)
                    <div class="col-lg-6 col-md-6 single__tes">
                        <div class="testimonial">
                            <div class="testimonial__thumb" style="width: 20px">
                                <img src="{{ asset('assets/profile.png') }}" alt="testimonial images">
                            </div>
                            <div class="testimonial__details">
                                <h4>{{ $comment->user->user_username }}</h4>
                                <p>{{ $comment->comment_content }}</p>
                                <h3 style="margin-top: 5px">
                                    <a href="{{ asset('products/' . $comment->product->product_id) }}">
                                        {{ $comment->product->product_name }}</a>
                                </h3>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
