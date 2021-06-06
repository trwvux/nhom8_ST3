<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Product;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{

    public function logout()
    {
        session()->forget('.config_user');
        return redirect()->back();
    }

    public function email_valid($username, $email)
    {
        $user = User::where("user_username", $username)->get();
        if (count($user) > 0) {
            $user = $user[0];
            if ($user->user_email_valid == 0) {
                if (Hash::check($user->user_email, $email)) {
                    $user->user_email_valid = 1;
                    $user->save();
                    return redirect("/sign-in")
                        ->with('alert', 'Địa chỉ email đã được xác nhận.');
                }
                return redirect("/sign-in")
                    ->with('alert', 'Xác thực không hợp lệ.');
            }
            return redirect("/sign-in")
                ->with('alert', 'Địa chỉ email đã được xác nhận.');
        }
        return redirect("/sign-in")
            ->with('alert', 'Xác thực không hợp lệ.');
    }

    public function signin()
    {
        return view('auth.pages.signin');
    }

    public function signin_post()
    {
        $username = request("username");
        $password = request("password");
        $user = User::where("user_username", $username)->get();
        if (count($user) === 0) return redirect()
            ->back()->with('alert', 'Tài khoản hoặc mật khẩu không chính xác.');

        $user = $user[0];
        if (!Hash::check($password, $user->user_password))
            return redirect()
                ->back()->with('alert', 'Tài khoản hoặc mật khẩu không chính xác.');

        if ($user->user_email_valid == 0) {
            $hashEmail = Hash::make($user->user_email, ['rounds' => 5,]);
            Mail::raw(
                'Vui lòng xác nhận địa chỉ email ở đây: ' . url('/valid-email/' . $user->user_username . "/" . $hashEmail),
                function ($message) use ($user) {
                    $message->to($user->user_email, 'Visitor')->subject('Xác Nhận Địa Chỉ Email Của Bạn');
                }
            );
            return redirect()
                ->back()->with('alert', 'Địa chỉ email chưa được xác nhận. Vui lòng kiểm tra email.');
        }

        session(['.config_user' => $user]);

        return redirect("be-admin");
    }

    public function signup()
    {
        return view('auth.pages.signup');
    }

    public function signup_post()
    {
        $email = request("email");
        $username = request("username");
        $password = request("password");
        $repassword = request("repassword");

        $getUsers = User::where("user_username", $username)->get();
        if (count($getUsers) > 0)
            return redirect()->back()->with('alert', 'Tên người dùng đã tồn tại.');

        $getUsersEmail = User::where("user_email", $email)->get();
        if (count($getUsersEmail) > 0)
            return redirect()->back()->with('alert', 'Địa chỉ email đã được sử dụng.');

        if ($password != $repassword)
            return redirect()->back()->with('alert', 'Mật khẩu nhập lại không khớp.');

        $newUser = new User;
        $newUser->user_email = $email;
        $newUser->user_username = $username;
        $hashed = Hash::make($password, ['rounds' => 12,]);
        $newUser->user_password = $hashed;
        $newUser->save();

        $hashEmail = Hash::make($newUser->user_email, ['rounds' => 5,]);
        Mail::raw(
            'Vui lòng xác nhận địa chỉ email ở đây: ' . url('/valid-email/' . $newUser->user_username . "/" . $hashEmail),
            function ($message) use ($newUser) {
                $message->to($newUser->user_email, 'Visitor')->subject('Xác Nhận Địa Chỉ Email Của Bạn');
            }
        );

        return redirect("sign-in")->with('alert', 'Tạo tài khoản thành công. Vui lòng xác nhận địa chỉ email và đăng nhập.');
    }
}
