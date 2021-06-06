<?php

namespace App\Http\Controllers;

use App\Order;
use App\OrderDetail;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function index()
    {
        $product = request()->query("product");

        if ($product) {
            $increase = request()->query("increase");
            $decrease = request()->query("decrease");
            $remove = request()->query("remove");

            $cartProducts = session()->get(".cart_products");
            if (!isset($cartProducts[$product]))
                $cartProducts[$product] = 0;
            if ($increase) $cartProducts[$product] += $increase;
            if ($decrease) {
                if ($cartProducts[$product] === 1) unset($cartProducts[$product]);
                else $cartProducts[$product] -= $decrease;
            }
            if ($remove) unset($cartProducts[$product]);

            session()->put(".cart_products", $cartProducts);
            return redirect("/cart");
        }

        return view('client.pages.cart');
    }

    public function store()
    {
        $userId = session()->get(".config_user")->user_id;
        $cartProducts = session()->get(".cart_products");

        $order = new Order;
        $order->user_id = $userId;
        $order->save();
        foreach ($cartProducts as $key => $value) {
            $detail = new OrderDetail;
            $detail->detail_quantity = $value;
            $detail->order_id = $order->order_id;
            $detail->product_id = $key;
            $detail->save();
        }

        session()->forget(".cart_products");

        return redirect("user")->with('alert', 'Đặt Hàng Thành Công.');
    }
}
