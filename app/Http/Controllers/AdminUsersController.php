<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Order;
use App\OrderDetail;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminUsersController extends Controller
{

    public function index()
    {
        $users = User::orderBy("user_id", "DESC");
        $countAllUser = User::all()->count();
        //search form
        $search = request()->query("search");
        if ($search) {
            $users = User::query()
                ->where('user_username', 'LIKE', "%{$search}%");

            $countAllUser = $users->count();
        }
        //pagination
        $perPage = request()->query("perPage");
        if (!$perPage) $perPage = 6;
        $users = $users->paginate($perPage);
        return view(
            'admin.pages.users.index',
            [
                'users' => $users,
                'countAllUser' => $countAllUser,
                'perPage' => $perPage
            ]
        );
    }

    public function create()
    {
        return view('admin.pages.users.create');
    }

    public function store(Request $request)
    {
        $user = new User;
        $getUsers = User::where("user_username", request('username'))->get();
        if (count($getUsers) > 0)
            return redirect()->back()->with('alert', 'Tên người dùng đã tồn tại.');
        $getUsers = User::where("user_email", request('email'))->get();
        if (count($getUsers) > 0)
            return redirect()->back()->with('alert', 'Email đã tồn tại.');
        $user->user_username = request('username');
        $user->user_email = request('email');
        $user->user_email_valid = 1;
        $hashed = Hash::make(request('password'), ['rounds' => 12,]);
        $user->user_password = $hashed;
        $user->user_permission =  request('permission');
        $user->save();
        return redirect("/be-admin/users")
            ->with('alert', "Tạo tài khoản thành công!");
    }

    public function show($id)
    {
        return redirect()->action('AdminUsersController@edit', [$id]);
    }

    public function edit($id)
    {
        //edit user
        $user = User::where("user_id", $id)->get()[0];
        return view('admin.pages.users.edit', [
            'user' => $user
        ]);
    }

    public function update($id)
    {
        $password = request('password');
        $permission = request('permission');

        $user = User::find($id);
        $hashed = Hash::make($password, ['rounds' => 12,]);
        $password && $user->user_password = $hashed;
        $permission && $user->user_permission = $permission;

        $user->save();

        return redirect("/be-admin/users/" . $id . "/edit")
            ->with("alert", "Cập nhật thành công.");
    }

    public function destroy($id)
    {
        Comment::where("user_id", $id)->delete();
        $orders = Order::where("user_id", $id)->get();
        foreach ($orders as $order) {
            OrderDetail::where("order_id", $order->order_id)->delete();
        }
        Order::where("user_id", $id)->delete();
        User::where("user_id", $id)->delete();
        return redirect()->back()->with("alert", "Xóa thành công.");
    }
}
