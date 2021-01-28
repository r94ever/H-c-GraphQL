<?php

namespace App\GraphQL\Mutations;

use App\Models\User;
use GraphQL\Type\Definition\ResolveInfo;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Hash;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class Login
{
    public function __invoke($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
//        $user = User::whereEmail(Arr::get($args, 'email'))->first();
//
//        if (! $user) {
//            return false;
//        }
//
//        if (! Hash::check(Arr::get($args, 'password'), $user->password)) {
//            return false;
//        }
        $credentials = Arr::only($args, ['email', 'password']);

        if ($token = auth()->attempt($credentials)) {
            /** @var User $user */
            $user = auth()->user();
            $user->setAttribute('access_token', $token);

            return $user;
        }

        return false;
    }
}
