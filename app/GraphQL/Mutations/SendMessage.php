<?php

namespace App\GraphQL\Mutations;

use App\Models\Chat;
use Illuminate\Support\Arr;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;
use GraphQL\Type\Definition\ResolveInfo;

class SendMessage
{
    public function __invoke($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        return Chat::query()->create([
            'sender_id' => auth()->id(),
            'receiver_id' => Arr::get($args, 'receiver_id'),
            'message' => Arr::get($args, 'message'),
            'status' => 'sent'
        ]);
    }
}
