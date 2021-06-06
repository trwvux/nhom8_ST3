<?php

namespace App\Http\Controllers;

use App\Comment;
use Illuminate\Http\Request;

class AdminCommentsController extends Controller
{
    public function index()
    {
        $comments = Comment::all()->reverse();
        $countAllComment = Comment::all()->count();
        // products pagination
        $perPage = request()->query("perPage");
        if (!$perPage) $perPage = 6;
        $comments = $this->paginate($comments, $perPage);

        return view(
            'admin.pages.comments.index',
            [
                "comments" => $comments,
                "countAllComment" => $countAllComment,
                'perPage' => $perPage
            ]
        );
    }

    public function destroy($id)
    {
        Comment::where("comment_id", $id)->delete();
        return redirect()->back()->with("alert", "Xóa thành công.");
    }

    public function store(Request $request)
    {
        $rating = request("rating");
        $content = request("content");
        $product = request("product");
        $user = session('.config_user')->user_id;

        $newComment = new Comment;
        if ($rating) $newComment->comment_rating = $rating;
        else $newComment->comment_rating = -1;
        $newComment->comment_content = $content;
        $newComment->product_id = $product;
        $newComment->user_id = $user;
        $newComment->save();

        return redirect()->back();
    }
}
