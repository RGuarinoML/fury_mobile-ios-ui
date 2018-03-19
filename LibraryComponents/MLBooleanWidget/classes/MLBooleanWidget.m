//
// MLSelectionWidget.m
// MLUI
//
// Created by Santiago Lazzari on 6/14/16.
// Copyright © 2016 MercadoLibre. All rights reserved.
//

#import "MLBooleanWidget.h"

#import "MLBooleanWidget_Protected.h"

@implementation MLBooleanWidget

#pragma mark - Init
+ (instancetype)booleanWidgetWithDelegate:(id <MLBooleanWidgetDelegate> )delegate
{
	MLBooleanWidget *selectionWidget = [[self alloc] init];

	selectionWidget.delegate = delegate;

	return selectionWidget;
}

- (instancetype)init
{
	if (self = [super init]) {
		[self commonInit];
	}

	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self commonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder]) {
		[self commonInit];
	}

	return self;
}

- (void)commonInit
{
	// Default radio button state is clear
	[self off];

	self.backgroundColor = [UIColor clearColor];

	[self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(booleanWidgetWasTapped:)]];
}

#pragma mark - Navigation
- (void)layoutSubviews
{
	[super layoutSubviews];

	if ([self isOn]) {
		[self setOnBooleanWidgetAnimated:NO];
	} else {
		[self setOffBooleanWidgetAnimated:NO];
	}
}

#pragma mark - Actions
- (void)setStateOn
{
	self.isBooleanWidgetOn = YES;
}

- (void)setStateOff
{
	self.isBooleanWidgetOn = NO;
}

- (void)on
{
	[self onAnimated:YES];
}

- (void)onAnimated:(BOOL)animated
{
	[self setOnBooleanWidgetAnimated:animated];
	[self setStateOn];
}

- (void)off
{
	[self offAnimated:YES];
}

- (void)offAnimated:(BOOL)animated
{
	[self setStateOff];
	[self setOffBooleanWidgetAnimated:animated];
}

- (BOOL)isOn
{
	return self.isBooleanWidgetOn;
}

- (BOOL)isOff
{
	return !self.isBooleanWidgetOn;
}

- (void)toggle
{
	[self toggleAnimated:YES];
}

- (void)toggleAnimated:(BOOL)animated
{
	if (self.isBooleanWidgetOn) {
		[self offAnimated:animated];
	} else {
		[self onAnimated:animated];
	}
}

#pragma mark - Animations
- (void)setOffBooleanWidgetAnimated:(BOOL)animated
{
}                                 // TO OVERRIDE

- (void)setOnBooleanWidgetAnimated:(BOOL)animated
{
}                                // TO OVERRIDE

#pragma mark - Actions
- (void)booleanWidgetWasTapped:(id)seneder
{
	if ([self.delegate respondsToSelector:@selector(booleanWidgetDidRequestChangeOfState:)]) {
		[self.delegate booleanWidgetDidRequestChangeOfState:self];
	}

	if ([self.delegate respondsToSelector:@selector(booleanWidgetWasTapped:)]) {
		[self.delegate booleanWidgetWasTapped:self];
	}
}

@end
