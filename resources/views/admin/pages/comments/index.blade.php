@extends('layouts.admin', ['title' => "Products"])

@section('content')
    <main class="content">
        <div class="container-fluid p-0">
            <div class="row py-3 mb-3">
                <div class="col-6">
                    <h1 class="h3 mb-3">Bình Luận</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="width:15%;">Mã Bình Luận</th>
                                    <th style="width:20%">Tác Giả</th>
                                    <th style="width:20%">Nội Dung</th>
                                    <th style="width:15%">Bài Viết</th>
                                    <th style="width:15%">Đánh Giá</th>
                                    <th style="width:15%">Thời Gian</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($comments as $comment)
                                    <tr>
                                        <td>{{ $comment->comment_id }}</td>
                                        <td>{{ $comment->user->user_username }}</td>
                                        <td>{{ $comment->comment_content }}</td>
                                        <td>
                                            <a
                                                href="{{ asset('products/' . $comment->product->product_id) }}">{{ $comment->product->product_name }}</a>
                                        </td>
                                        </td>
                                        <td>
                                            @for ($i = 0; $i < $comment->comment_rating; $i++)
                                                <i class="fa fa-star" aria-hidden="true" style="color: yellowgreen"></i>
                                            @endfor
                                            @for ($i = 0; $i < 5 - $comment->comment_rating; $i++)
                                                <i class="fa fa-star" aria-hidden="true" style="color: black"></i>
                                            @endfor

                                        </td>
                                        <td>
                                            {{ $comment->created_at }}
                                        </td>
                                        <td class="table-action">
                                            <div class="d-flex align-items-center">
                                                <form class="mb-0"
                                                    action="{{ asset('/be-admin/comments/' . $comment->comment_id) }}"
                                                    method="POST">
                                                    @method('DELETE')
                                                    @csrf
                                                    <button class="btn" type="submit"><i class="align-middle"
                                                            data-feather="trash"></i></button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12 d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            @php
                                $page = request()->query('page');
                                if (!$page) {
                                    $page = 1;
                                }
                            @endphp
                            @for ($i = 0; $i < $countAllComment / $perPage; $i++)
                                <li class="page-item {{ $page == $i + 1 ? 'active' : '' }}">
                                    <a class="page-link" href="{{ request()->fullUrlWithQuery(['page' => $i + 1]) }}">
                                        {{ $i + 1 }}
                                    </a>
                                </li>
                            @endfor
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </main>
@endsection
