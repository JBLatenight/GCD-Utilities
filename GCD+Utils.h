//
//  GCD+Utils.h
//  GCD+Utils
//
//  Created by Jeff Bargmann on 9/8/12.
//  Copyright (c) 2012 Jeff Bargmann. MIT License
//

//Convenience utility functions for Grand Central Dispatch
void dispatch_main_sync(dispatch_block_t block);
void dispatch_main_async(dispatch_block_t block);
void dispatch_delay(NSTimeInterval delay, dispatch_queue_t queue, dispatch_block_t block); //executes block on specified queue after delay-seconds
void dispatch_main_delay(NSTimeInterval delay, dispatch_block_t block); //executes block on main queue after delay-seconds
void dispatch_default_queue_async(dispatch_block_t block);
void dispatch_background_queue_async(dispatch_block_t block);
void dispatch_lowpriority_queue_async(dispatch_block_t block);
void dispatch_highpriority_queue_async(dispatch_block_t block);