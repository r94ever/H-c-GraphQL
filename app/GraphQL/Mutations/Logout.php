<?php

namespace App\GraphQL\Mutations;

use GraphQL\Type\Definition\ResolveInfo;
use Illuminate\Support\Arr;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class Logout
{
    public function __invoke($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        auth()->loginUsingId(Arr::get($args, 'id'));
    }
}
