<?php

namespace App\GraphQL\Mutations;

use App\Models\User;
use GraphQL\Type\Definition\ResolveInfo;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Arr;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class UpdateUser
{
    public function __invoke($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        if (! $user = User::find(Arr::get($args, 'id'))) {
            return false;
        }

        $user->name = Arr::get($args, 'name');
        $user->email = Arr::get($args, 'email');

        if (Arr::get($args, 'avatar') instanceof UploadedFile) {
            $user->avatar = $this->uploadAvatar(Arr::get($args, 'avatar'));
        }

        $user->save();

        return $user;
    }

    protected function uploadAvatar(UploadedFile $file)
    {
        $fileName = $file->getClientOriginalName();

        return $file->storePublicly('public/avatars');
    }
}
