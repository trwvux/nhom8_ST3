<?php

namespace App\Http\Controllers;

class AdminController extends Controller
{
    public function index()
    {
        return redirect("/be-admin/products");
    }
}
