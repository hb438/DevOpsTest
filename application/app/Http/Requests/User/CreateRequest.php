<?php

namespace DevOpsTest\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class CreateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            '*.chip_user_id' => 'required|distinct|integer|min:1',
            '*.name' => 'required|string|max:100',
            '*.mobile' => 'required|distinct'
        ];
    }
}
