<!DOCTYPE html>
<html class="no-js" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

@include('client.base.head', ['title' => $title ?? 'No Title'])

<script>
    var msg = '{{ Session::get('alert') }}';
    var exist = '{{ Session::has('alert') }}';
    if (exist) {
        alert(msg);
    }
</script>

<body>
    <div class="wrapper">
        @include('client.common.header')

        @if ($layout ?? 'default' == 'home')
            @yield('content')
        @else
            @yield('content')
            @include('client.common.brand')
        @endif

        @include('client.common.footer')
    </div>

    @include('client.base.script')
</body>

</html>
