<?php

namespace App\Http\Controllers;

use App\Category;
use App\Manufacturer;
use App\Product;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\View;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $manufacturers;
    protected $categories;
    protected $cartProducts = array();

    public function __construct()
    {
        $this->manufacturers = Manufacturer::all();
        View::share('manufacturers', $this->manufacturers);

        $this->categories = Category::all();
        View::share('categories', $this->categories);

        $this->middleware(function ($request, $next) {
            $cartProducts = session()->get(".cart_products");
            if ($cartProducts) {
                foreach ($cartProducts as $key => $value) {
                    $product = Product::where("product_id", $key)->get()[0];
                    if ($product) {
                        $product->product_quantity = $value;
                        array_push($this->cartProducts, $product);
                    }
                }
            }
            View::share('cartProducts', $this->cartProducts);

            return $next($request);
        });
    }

    public function paginate($items, $perPage = 15, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }
}
