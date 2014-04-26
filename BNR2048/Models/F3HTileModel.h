//
//  F3HTileModel.h
//  NumberTileGame
//
//  Created by Austin Zheng on 3/24/14.
//
//

#import <Foundation/Foundation.h>

@interface F3HTileModel : NSObject

@property (nonatomic) BOOL empty;
@property (nonatomic) NSUInteger value;
@property (nonatomic) UIImageView *imageView;
+ (instancetype)emptyTile;

@end
