<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public $primaryKey = "product_id";

    public function manufacturer()
    {
        return $this->belongsTo('App\Manufacturer', 'manufacturer_id');
    }

    public function categories()
    {
        return $this->belongsTo('App\Category', 'category_id');
    }

    public function comments()
    {
        return $this->hasMany('App\Comment', 'comment_id');
    }

    public function orders()
    {
        return $this->hasMany('App\OrderDetail', 'product_id');
    }
}
