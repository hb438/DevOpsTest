<?php

namespace Rhllor\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * @var array
     */
    protected $fillable = [
        'chip_user_id','user_hash', 'name', 'mobile',
    ];

    protected $casts = [
        'chip_user_id' => 'integer'
    ];
}
