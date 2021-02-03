<?php

namespace App\GraphQL\Queries;

use App\Models\Chat;
use App\Models\View;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;
use GraphQL\Type\Definition\ResolveInfo;

class GetReports
{
    public function __invoke($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
//        logger($args);
//        return Chat::query()
//            ->where(function ($query) use ($args) {
//                return $query->where('sender_id', Arr::get($args, 'sender_id'))
//                    ->where('receiver_id', Arr::get($args, 'receiver_id'));
//            })
//            ->orWhere(function ($query) use ($args) {
//                return $query->where('sender_id', Arr::get($args, 'receiver_id'))
//                    ->where('receiver_id', Arr::get($args, 'sender_id'));
//            })
//            ->limit(20)
//            ->get();
//        return View::query()->limit(10)->get(); e query returned more than one result.",
        return $this->getRawData($args);
    }

    protected function getRawData(array $args)
    {
        return View::query()->selectRaw(DB::raw("DATE_FORMAT(viewed_at, '%Y-%m-%d') as date, count(*) as total_views"))
            ->groupBy('date')
            ->whereBetween('viewed_at', $args['viewed_at'])
            ->get();
    }
}
