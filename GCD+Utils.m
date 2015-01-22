//
//  GCD+Utils.m
//  GCD+Utils
//
//  Created by Jeff Bargmann on 9/8/12.
//  Copyright (c) 2012 Jeff Bargmann. MIT License
//

#import "GCD+Utils.h"

void dispatch_main_sync(dispatch_block_t block)
{
    //If on main thread, just execute. Dispatch otherwise.
    if([NSThread isMainThread])
        block();
    else
        dispatch_sync(dispatch_get_main_queue(), block);
}
void dispatch_main_async(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(), block);
}
void dispatch_delay(NSTimeInterval delay, dispatch_queue_t queue, dispatch_block_t block)
{
    //Per documentation, use _async rather than _after if no delay
    if(delay <= 0.0)
        dispatch_async(queue, block);
    else
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), queue, block);
}
void dispatch_main_delay(NSTimeInterval delay, dispatch_block_t block)
{
    dispatch_delay(delay, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
void dispatch_default_queue_async(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
void dispatch_background_queue_async(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block);
}
void dispatch_lowpriority_queue_async(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), block);
}
void dispatch_highpriority_queue_async(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), block);
}
