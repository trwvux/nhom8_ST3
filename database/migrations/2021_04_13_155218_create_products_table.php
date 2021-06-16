<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id('product_id');
            $table->string('product_name');
            $table->integer('product_price')->default(0);
            $table->string('product_image')->nullable();
            $table->text('product_description')->default("");
            $table->integer('product_available')->default(0);

            $table->unsignedBigInteger('manufacturer_id');
            $table->unsignedBigInteger('category_id');
            $table->foreign('manufacturer_id')->references('manufacturer_id')->on('manufacturers');
            $table->foreign('category_id')->references('category_id')->on('categories');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
