<?php

namespace DevOpsTest\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class ReadRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'user_hash' => 'required|uuid'
        ];
    }

    public function all($keys = null)
    {
        $data = parent::all($keys);
        $data['user_hash'] = $this->route('user_hash');

        return $data;
    }
}
