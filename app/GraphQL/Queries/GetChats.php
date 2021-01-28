<?php

namespace App\GraphQL\Queries;

use App\Models\Chat;
use Illuminate\Support\Arr;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;
use GraphQL\Type\Definition\ResolveInfo;

class GetChats
{
    public function __invoke($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        return Chat::query()
            ->where(function ($query) use ($args) {
                return $query->where('sender_id', Arr::get($args, 'sender_id'))
                    ->where('receiver_id', Arr::get($args, 'receiver_id'));
            })
            ->orWhere(function ($query) use ($args) {
                return $query->where('sender_id', Arr::get($args, 'receiver_id'))
                    ->where('receiver_id', Arr::get($args, 'sender_id'));
            })
            ->limit(20)
            ->get();
    }
}
