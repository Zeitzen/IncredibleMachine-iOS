//
//  GenericLevel.m
//  IM
//
//  Created by Damian Rizzotto on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GenericLevel.h"
#import "Rotator.h"

@implementation GenericLevel{
    
    NSMutableArray* _AuxArray;

    CCNode *_selected;
    
    CCNode *_DashedCircle;
    CCNode *_RotateCircle;
    
    Boolean started;
    Boolean rotating;
    
    int stars;
}

-(id)init{
    self = [super init];
    self.userInteractionEnabled = TRUE;
    _RotateCircle.visible = FALSE;
    started = FALSE;

    _AuxArray=[[NSMutableArray alloc] init];

    
    _AllMovableArray=[[NSMutableArray alloc] init];
    _StaticArray=[[NSMutableArray alloc] init];
    _DynamicArray=[[NSMutableArray alloc] init];
    _LockedDynamicArray=[[NSMutableArray alloc] init];
    

    return self;
    
    stars = 3;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    if(started)
        return;
    rotating = FALSE;
    
    [self CheckObj:touch.locationInWorld];
    
    if(_selected != NULL){
        if(rotating){
            [(Rotator*)_RotateCircle stop];
        }else{
            float scale1 = (_selected.contentSize.width * 4) /(_RotateCircle.contentSize.width);
            float scale2 = (_selected.contentSize.height * 4) /(_RotateCircle.contentSize.height);
            float aux = MAX(scale1,scale2);
            _RotateCircle.scale = aux;
            _DashedCircle.scale = aux;

            _RotateCircle.visible = FALSE;
            _DashedCircle.visible = TRUE;
            _DashedCircle.position = _selected.position;
        }
    }
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(_selected == NULL || started)
        return;
    
    CGPoint touchLocation = touch.locationInWorld;
    
    if(rotating){
        float diff_X = touchLocation.x - _selected.position.x;
        float diff_Y = touchLocation.y - _selected.position.y;
        CGPoint diffPoint = ccp(diff_X, diff_Y);
        float angleRadians = atan2f(diffPoint.y,diffPoint.x);
        angleRadians = CC_RADIANS_TO_DEGREES(angleRadians);
        angleRadians = -angleRadians + 45;
        _selected.rotation=angleRadians;
        [(Rotator*)_RotateCircle rotate:angleRadians];
    }else{
        _selected.position = touchLocation;
        _DashedCircle.position = _selected.position;
    }
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(started )
        return;
    
    if(rotating){
        [(Rotator*)_RotateCircle play];
    }else{
        _DashedCircle.visible = FALSE;
        _RotateCircle.visible = TRUE;
        _RotateCircle.position = _selected.position;
    }
    
    if( _selected==NULL)
        _RotateCircle.visible = FALSE;
    
}

-(void)CheckObj:(CGPoint)touch{
    
    CCNode* aux = _selected;
    
    for(CCNode* c in _AllMovableArray){
        if(CGRectContainsPoint([c boundingBox], touch)){
            _selected = c;
            break;
        }else{
            _selected = NULL;
        }
    }
    
    if( _selected == NULL && aux != NULL && CGRectContainsPoint([_RotateCircle boundingBox], touch) &&  !CGRectContainsPoint([aux boundingBox], touch)){
        rotating = TRUE;
        _selected = aux;
    }
    
}

- (void)play {
    if(started){
        started = FALSE;
        int i = 0;

        for(CCNode* n in _DynamicArray){
            n.physicsBody.type= CCPhysicsBodyTypeStatic;
        }
        
        for(CCNode* n in _LockedDynamicArray){
            n.physicsBody.type= CCPhysicsBodyTypeStatic;
        }

        for(CCNode* n in _DynamicArray){
            CGPoint aux =[[_AuxArray objectAtIndex:i] CGPointValue];
            n.rotation = 0;
            n.position = aux;
            i++;
        }
        
        for(CCNode* n in _LockedDynamicArray){
            CGPoint aux =[[_AuxArray objectAtIndex:i] CGPointValue];
            n.rotation = 0;
            n.position = aux;
            i++;
        }

        _AuxArray=[[NSMutableArray alloc] init];
        
    }else{
        
        for(CCNode* n in _DynamicArray){
            CGPoint aux = ccp(n.position.x,n.position.y);
            [_AuxArray addObject:[NSValue valueWithCGPoint:aux]];
        }
        
        for(CCNode* n in _LockedDynamicArray){
            CGPoint aux = ccp(n.position.x,n.position.y);
            [_AuxArray addObject:[NSValue valueWithCGPoint:aux]];
        }
        
        started=TRUE;
        _RotateCircle.visible = FALSE;
        
        for(CCNode* n in _DynamicArray){
            n.physicsBody.type= CCPhysicsBodyTypeDynamic;
        }
        
        for(CCNode* n in _LockedDynamicArray){
            n.physicsBody.type= CCPhysicsBodyTypeDynamic;
        }
        
    }
}


-(void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair star:(CCNode *)nodeA wildcard:(CCNode *)nodeB {
    [nodeA removeFromParent];
    stars --;
    CCLOG(@"se dfsdfs la joda");

    if(stars == 0)
        CCLOG(@"se acabo la joda");
}

@end
