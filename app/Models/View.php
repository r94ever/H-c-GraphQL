<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class View extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = ['viewed_at'];

    public function post(): BelongsTo
    {
        return $this->belongsTo(Post::class);
    }
}
