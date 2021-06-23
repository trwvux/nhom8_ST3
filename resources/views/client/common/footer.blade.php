<!-- <footer id="htc__footer">
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
</footer> -->
<footer id="htc__footer">
            <!-- Start Footer Widget -->
            <div class="footer__container bg__cat--1">
                <div class="container">
                    <div class="row">
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer">
                                <h2 class="title__line--2">Về chúng tôi</h2>
                                <div class="ft__details">
                                    <p>Chúng tôi cung cấp những loại nhạc cụ từ các thương hiệu hàng đầu thế giới.</p>
                                    <div class="ft__social__link">
                                        <ul class="social__link">
                                            <li><a href="#"><i class="icon-social-twitter icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-instagram icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-facebook icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-google icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-linkedin icons"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40">
                            <div class="footer">
                                <h2 class="title__line--2">Thông tin</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">Về chúng tôi</a></li>
                                        <li><a href="#">Thông tin giao hàng</a></li>
                                        <li><a href="#">Chính sách bảo mật</a></li>
                                        <li><a href="#">Điều khoản & điều kiện</a></li>
                                        <li><a href="#">Thương hiệu</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">Tài khoản</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">Thông tin tài khoản</a></li>
                                        <li><a href="cart.html">Giỏ hàng</a></li>
                                        <li><a href="#">Dăng nhập</a></li>
                                        <li><a href="wishlist.html">Danh sách yêu thích</a></li>
                                        <li><a href="checkout.html">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">Dịch vụ</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">Giao hàng</a></li>
                                        <li><a href="#">Chính sách đổi trả</a></li>
                                        <li><a href="#">Bảo hành</a></li>
                                        <li><a href="#">Khắc phụ sự cố</a></li>
                                        <li><a href="#">Liên hệ</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">Đăng ký nhận tin</h2>
                                <div class="ft__inner">
                                    <div class="news__input">
                                        <input type="text" placeholder="Mail của bạn...">
                                        <div class="send__btn">
                                            <a class="fr__btn" href="#">Gửi</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                    </div>
                </div>
            </div>
           
        </footer>