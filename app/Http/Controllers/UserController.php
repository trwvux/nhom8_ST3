<?php

namespace App\Http\Controllers;

use App\Order;

class UserController extends Controller
{
    public function index()
    {
        $user = session(".config_user");
        if (!$user) return redirect("sign-in");

        $orders = Order::where("user_id", $user->user_id)->get();
        return view('client.pages.user', ['orders' => $orders]);
    }
}
