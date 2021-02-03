<?php

namespace App\GraphQL\Types;

use Exception;
use GraphQL\Error\Error;
use GraphQL\Language\AST\BooleanValueNode;
use GraphQL\Language\AST\FloatValueNode;
use GraphQL\Language\AST\IntValueNode;
use GraphQL\Language\AST\Node;
use GraphQL\Utils\Utils;
use GraphQL\Language\AST\NullValueNode;
use GraphQL\Language\AST\StringValueNode;
use GraphQL\Type\Definition\ScalarType;
use Illuminate\Support\Carbon;

class DateRange extends ScalarType
{
    /**
     * @inheritDoc
     */
    public function serialize($value)
    {
        return $this->parseValue($value);
    }

    /**
     * @inheritDoc
     */
    public function parseValue($value)
    {
        return $value;
    }

    /**
     * @inheritDoc
     */
    public function parseLiteral(Node $valueNode, ?array $variables = null)
    {
        $dates = explode(",", $valueNode->value);
        logger($valueNode->value);
        logger('\dsdsds');

        if (count($dates) !== 2) {
            throw new Error("Invalid date range data", [$valueNode]);
        }

        try {
            $startDate = Carbon::parse($dates[0]);
        }
        catch (Exception $e) {
            throw new Error("Invalid start date format",  [$valueNode]);
        }

        try {
            $endDate = Carbon::parse($dates[1]);
        }
        catch (Exception $e) {
            throw new Error("Invalid end date format",  [$valueNode]);
        }

        if ($startDate->greaterThan($endDate)) {
            throw new Error("Start date must before end date",  [$valueNode]);
        }

        return [
            $startDate->startOfDay()->toDateTimeString(),
            $endDate->endOfDay()->toDateTimeString()
        ];
    }
}
