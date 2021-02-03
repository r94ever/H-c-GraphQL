<?php

namespace App\Console\Commands;

use App\Models\Post;
use Illuminate\Console\Command;

class SeedViews extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'view:seed';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $startTime = now()->subMonths(9)->startOfMonth()->startOfDay();
        $endTime = now();

        $posts = Post::all();

        do {
            /** @var Post $post */
            $post = $posts->random();
            $post->views()->create(['viewed_at' => $startTime->toDateTimeString()]);
            $this->info("Added view for post [{$post->title}] at [{$startTime->toDateTimeString()}]");
            $startTime->addMinutes(rand(30, 50));
        } while ($startTime < $endTime);

        $this->info('Completed');
        return 1;
    }
}
