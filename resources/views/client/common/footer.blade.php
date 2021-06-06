<footer id="htc__footer">
    <div class="footer__container bg__cat--1" style="padding-top: 65px">
        <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer">
                        <h2 class="title__line--2">Về Chúng Tôi</h2>
                        <div class="ft__details">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 xmt-40">
                    <div class="footer">
                        <h2 class="title__line--2">Hãng Sản Xuất</h2>
                        <div class="ft__inner">
                            <ul class="ft__list">
                                @foreach ($manufacturers as $manufacturer)
                                    <li><a
                                            href="{{ asset('products?manufacturer=' . $manufacturer->manufacturer_id) }}">
                                            {{ $manufacturer->manufacturer_name }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 xmt-40 smt-40">
                    <div class="footer">
                        <h2 class="title__line--2">Danh Mục</h2>
                        <div class="ft__inner">
                            <ul class="ft__list">
                                @foreach ($categories as $category)
                                    <li><a href="{{ asset('products?category=' . $category->category_id) }}">
                                            {{ $category->category_name }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 xmt-40 smt-40">
                    <div class="footer">
                        <h2 class="title__line--2">Tin Mới</h2>
                        <div class="ft__inner">
                            <div class="news__input">
                                <input type="text" placeholder="Email của bạn*">
                                <div class="send__btn">
                                    <a class="fr__btn" href="#">Gửi Email</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
