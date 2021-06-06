<?php

namespace App\Http\Controllers;

use App\Categorizable;
use App\Category;
use App\Comment;
use App\Manufacturer;
use App\Product;
use Illuminate\Http\Request;

class AdminProductsController extends Controller
{

    public function index()
    {
        // count all products
        $products = Product::orderBy("product_id", "DESC");
        $countAllProduct = Product::all()->count();

        // search form
        $search = request()->query("search");
        if ($search) {
            $products = Product::query()
                ->where('product_name', 'LIKE', "%{$search}%")
                ->orWhere('product_description', 'LIKE', "%{$search}%");

            $countAllProduct = $products->count();
        }

        // products pagination
        $perPage = request()->query("perPage");
        if (!$perPage) $perPage = 6;
        $products = $products->paginate($perPage);

        return view('admin.pages.products.index', [
            'countAllProduct' => $countAllProduct,
            'products' => $products,
            'perPage' => $perPage,
        ]);
    }

    public function create() // tạo sản phẩm
    {
        return view('admin.pages.products.create');
    }

    public function store(Request $request) // thêm
    {
        $name = request("name");
        $manufacturer = request("manufacturer");
        $categories = request("categories");
        $description = request("description");
        $price = request("price");
        $available = request("available");
        $image = $request->file('image');
        $image && $image->move('assets/images', $image->getClientOriginalName());

        $product = new Product;
        $product->product_name = $name;
        $product->manufacturer_id = $manufacturer;
        $product->product_description = $description;
        $product->product_price = $price;
        $product->product_available = $available;
        $image && $product->product_image = $image->getClientOriginalName();
        $product->save();
        $product = $product->fresh();

        if ($categories)
            for ($i = 0; $i < count($categories); $i++) {
                $categorizable = new Categorizable;
                $categorizable->category_id = $categories[$i];
                $categorizable->product_id = $product->product_id;
                $categorizable->save();
            }

        return redirect("/be-admin/products")
            ->with('alert', "Tạo sản phẩm thành công!");
    }

    public function show($id) // hiển thị
    {
        return redirect()->action('AdminProductsController@edit', [$id]);
    }

    public function edit($id) // hiển thị sửa
    {
        $product = Product::where("product_id", $id)->get()[0];
        return view('admin.pages.products.edit', [
            'product' => $product,
        ]);
    }

    public function update(Request $request, $id) //sửa 
    {
        $name = request("name");
        $manufacturer = request("manufacturer");
        $categories = request("categories");
        $description = request("description");
        $price = request("price");
        $available = request("available");
        $image = $request->file('image');
        $image && $image->move('assets/images', $image->getClientOriginalName());

        $product = Product::find($id);
        $name && $product->product_name = $name;
        $manufacturer && $product->manufacturer_id = $manufacturer;
        $description && $product->product_description = $description;
        $price && $product->product_price = $price;
        $available && $product->product_available = $available;
        $image && $product->product_image =  $image->getClientOriginalName();
        $product->save();

        Categorizable::where("product_id", $id)->delete();
        // error_log(json_encode($categories));
        if ($categories)
            for ($i = 0; $i < count($categories); $i++) {
                $categorizable = new Categorizable;
                $categorizable->category_id = $categories[$i];
                $categorizable->product_id = $product->product_id;
                $categorizable->save();
            }
        return redirect("/be-admin/products/" . $id . "/edit")
            ->with("alert", "Cập nhật thành công.");
    }

    public function destroy($id) // xóa
    {
        Comment::where("product_id", $id)->delete();
        Categorizable::where("product_id", $id)->delete();
        Product::where("product_id", $id)->delete();
        return redirect()->back()->with("alert", "Xóa thành công.");
    }
}
