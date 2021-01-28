<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts_categories', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('post_id')->index();
            $table->unsignedBigInteger('category_id')->index();
        });

        Schema::table('posts_categories', function (Blueprint $table) {
            $table->foreign('post_id')
                ->references('id')
                ->on('posts')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();

            $table->foreign('category_id')
                ->references('id')
                ->on('categories')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts_categories');
    }
}
