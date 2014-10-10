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
    CCPhysicsNode *_physicsNode;
    
    CCNode *_selected;
    
    CCNode *_DashedCircle;
    CCNode *_RotateCircle;
    
    Boolean started;
    Boolean rotating;
}

-(id)init{
    self = [super init];
    self.userInteractionEnabled = TRUE;
    _RotateCircle.visible = FALSE;
    started = FALSE;
    
    //we can sign up as the collision delegate of our physics node.
    _physicsNode.collisionDelegate = self;
    
    _SpriteArray=[[NSMutableArray alloc] init];
    return self;
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
            //            float scale1 = _RotateCircle.contentSize.width / _selected.contentSize.width;
            //            float scale2 = _RotateCircle.contentSize.height / _selected.contentSize.height;
            
            _RotateCircle.scale = 1.5;
            
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
    
    for(CCNode* c in _SpriteArray){
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
        CCScene *gameplayScene = [CCBReader loadAsScene:@"Level1_1"];
        [[CCDirector sharedDirector] replaceScene:gameplayScene];
    }else{
        started=TRUE;
        _RotateCircle.visible = FALSE;
        
        for(CCNode* c in _SpriteArray){
            c.physicsBody.type= CCPhysicsBodyTypeDynamic;
        }
    }
}

@end
