<!DOCTYPE html>
<html class="no-js" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

@include('admin.base.head', ['title' => $title ?? 'No Title'])

<script>
    var msg = '{{ Session::get('alert') }}';
    var exist = '{{ Session::has('alert') }}';
    if (exist) {
        alert(msg);
    }
</script>

<body>

    <div class="wrapper">
        @include('admin.common.sidebar')
        <div class="main">
            @include('admin.common.navbar')
            @yield('content')
            @include('admin.common.footer')
        </div>
    </div>

    @include('admin.base.script')
</body>

</html>
