<?php

namespace App\GraphQL\Directives;

use App\Models\View;
use GraphQL\Type\Definition\ResolveInfo;
use Illuminate\Support\Facades\DB;
use Nuwave\Lighthouse\Schema\Directives\BaseDirective;
use Nuwave\Lighthouse\Schema\Values\FieldValue;
use Nuwave\Lighthouse\Support\Contracts\FieldResolver;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class ReportDirective extends BaseDirective implements FieldResolver
{
    /**
     * @inheritDoc
     */
    public static function definition(): string
    {
        return /** @lang GraphQL */ <<<'GRAPHQL'
directive @report(
  """
  Specify the database column to compare.
  Only required if database column has a different name than the attribute in your schema.
  """
  key: String
) on ARGUMENT_DEFINITION | INPUT_FIELD_DEFINITION
GRAPHQL;
    }

    /**
     * @inheritDoc
     */
    public function resolveField(FieldValue $fieldValue)
    {
        /** @var View $model */
        $model = $this->getModelClass();

        return $fieldValue->setResolver(
            function ($root, array $args, GraphQLContext $context, ResolveInfo $resolveInfo) use ($model) {
                logger($resolveInfo->argumentSet->arguments);
                $results = $resolveInfo
                    ->argumentSet
                    ->enhanceBuilder(
                        /** @var View $this->getModelClass() */
                        $model::query()->selectRaw(DB::raw("DATE_FORMAT(viewed_at, '%Y-%m-%d') as date"))
                            ->addSelect(DB::raw('count(*) as total_views'))
                            ->groupBy('date')
                            ->whereBetween('viewed_at', $args['viewed_at']),
                        $this->directiveArgValue('scopes', [])
                    )
                    ->get();

                return $results;
            }
        );
    }
}
