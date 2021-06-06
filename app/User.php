<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public $primaryKey = "user_id";

    public function comments()
    {
        return $this->hasMany('App\Comment', 'comment_id');
    }
}
