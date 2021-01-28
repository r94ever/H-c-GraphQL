<?php

namespace App\Listeners;

use App\Events\PostUpdated;
use App\Notifications\PostUpdatedNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class NotifyWhenPostUpdated
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  PostUpdated  $event
     * @return void
     */
    public function handle($event)
    {
        $event->post->author->notify(new PostUpdatedNotification($event->post));
    }
}
