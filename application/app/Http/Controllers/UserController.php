<?php

namespace DevOpsTest\Http\Controllers;

use Illuminate\Http\JsonResponse;
use DevOpsTest\Http\Requests\User\ReadRequest;
use DevOpsTest\Models\User;

class UserController extends Controller
{
    /**
     * Display the specified resource.
     *
     * @param  ReadRequest  $request
     *
     * @return JsonResponse
     */
    public function get(ReadRequest $request) : JsonResponse
    {
        $user = User::where(['user_hash' => $request->route('user_hash')])->first();

        return $user
            ? response()->json($user)
            : response()->json($user, 404);
    }
}
