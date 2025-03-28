/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma clang diagnostic ignored "-Wdeprecated-objc-isa-usage"

#import "NSMutableArray.h"

@implementation NSMutableArray

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
  id a = object_getClass(anObject);
}

- (void)removeObjectsAtIndexes:(NSIndexSet*)indexes {
  id a = object_getClass(indexes);
}

- (void)replaceObjectsAtIndexes:(NSIndexSet*)indexes
                    withObjects:(NSArray*)objects {
  id a = object_getClass(indexes);
  id b = object_getClass(objects);
}

- (void)setObject:(id)anObject atIndexedSubscript:(NSUInteger)index {
  id a = object_getClass(anObject);
}

- (void)addObject:(id)anObject {
  id a = object_getClass(anObject);
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
  id a = object_getClass(anObject);
}

+ (instancetype)array {
  return [NSMutableArray alloc];
}

@end
