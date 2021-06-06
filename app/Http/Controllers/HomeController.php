<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Http\Controllers\Controller;
use App\Product;

class HomeController extends Controller
{
    public function index()
    {
        $productsNew = Product::orderBy('product_id', 'DESC')->get()->take(8);
        $productBestSeller = Product::all()->take(8);
        $newComments = Comment::where("comment_rating", '5')->get()->take(5);

        return view('client.pages.home', [
            'productsNew' => $productsNew,
            'productBestSeller' => $productBestSeller,
            'newComments' => $newComments,
        ]);
    }
}
