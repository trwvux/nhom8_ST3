<?php

namespace App\Http\Controllers;

use App\Category;
use App\Manufacturer;
use Illuminate\Http\Request;

class AdminTaxonomiesController extends Controller
{
    public function index()
    {
        // 
        return view('admin.pages.taxonomies.index');
    }

    public function create()
    {
        //create manufacture
        if(request()->query("type") == "manufacturer") {
            return view('admin.pages.taxonomies.create-manufacturer');
        }
        //create category
        if (request()->query("type") == "category") {
            return view('admin.pages.taxonomies.create-category');
        }
    }

    public function store()
    {
        $name = request("name");
        // add manufacture
        if (request("type") == "manufacturer") {
            $manufacturer = new Manufacturer;
            $manufacturer->manufacturer_name = $name;
            $manufacturer->save();
            return redirect("/be-admin/taxonomies")
            ->with('alert', "Thêm hãng sản xuất thành công!");
        }
        // add category 
        if (request("type") == "category") {
            $category = new Category;
            $category->category_name = $name;
            $category->save();
            return redirect("/be-admin/taxonomies")
            ->with('alert', "Thêm danh mục thành công!");
        }
    }
    
    public function show($id)
    {
        return redirect()->action('AdminTaxonomiesController@edit', [$id]);
    }

    public function edit($id)
    {

        if (request()->query("type") == "manufacturer") {
            // làm hãng sx trong này
            $manufacturer = Manufacturer::where("manufacturer_id", $id)->get()[0];
            return view('admin.pages.taxonomies.edit-manufacturer', [
                'manufacturer' => $manufacturer,]);
        }

        if (request()->query("type") == "category") {
            // làm chuyen muc trong này
            $category = Category::where("category_id", $id)->get()[0];
            return view('admin.pages.taxonomies.edit-category', [
                'category' => $category,]);
        }
    }

    public function update(Request $request, $id)
    {
        $name = request("name");
        //update manufactures
        if (request("type") == "manufacturer") {
            $manufacturer = Manufacturer::find($id);
            $name && $manufacturer->manufacturer_name = $name;
            $manufacturer->save();
            return redirect("/be-admin/taxonomies/" . $id . "/edit?type=manufacturer")
            ->with("alert", "Cập nhật thành công.");
        }
        //update category
        if (request("type") == "category") {
            $category = Category::find($id);
            $name && $category->category_name = $name;
            $category->save();
            return redirect("/be-admin/taxonomies/" . $id . "/edit?type=category")
            ->with("alert", "Cập nhật thành công.");
        }
    }

    public function destroy($id)
    {
        //delete manufacture
        if (request("type") == "manufacturer") {
            Manufacturer::where("manufacturer_id", $id)->delete();
            return redirect()->back()->with("alert", "Xóa thành công.");
        }
        // delete category
        if (request("type") == "category") {
            Category::where("category_id", $id)->delete();
            return redirect()->back()->with("alert", "Xóa thành công.");
        }
    }
}
