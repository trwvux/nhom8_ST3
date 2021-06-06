<?php

namespace App\Http\Controllers;

use App\Order;
use App\OrderDetail;
use Illuminate\Http\Request;

class AdminOrdersController extends Controller
{
    public function index()
    {
        $orders = Order::all()->reverse();
        $order_details = OrderDetail::all()->reverse();
        $countAllOrder = Order::all()->count();
        $perPage = request()->query("perPage");
        if (!$perPage) $perPage = 6;
        $orders = $this->paginate($orders,$perPage);

        $status = request()->query('status');
        if ($status != '') $orders = Order::where('order_status', $status)->get();

        return view('admin.pages.orders.index', [
            "orders" => $orders,
            "order_details" => $order_details,
            "countAllOrder" => $countAllOrder,
            "perPage" => $perPage,
        ]);
    }

    public function destroy($order_id)
    {
        OrderDetail::where("order_id", $order_id)->delete();
        Order::where("order_id", $order_id)->delete();
        return redirect()->back()->with("alert", "Xóa thành công");
    }

    public function update(Request $request, $order_id)
    {

        $order = Order::find($order_id);
        $order->order_status = 1;
        $order->save();
        return redirect()->back()->with("alert", "Duyệt thành công");
    }
}
