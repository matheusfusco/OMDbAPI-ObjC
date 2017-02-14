//
//  FilmTableViewCell.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmTableViewCell.h"

@implementation FilmTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    return self;
}

-(void)setFilm:(FilmModel *)film {
    [_filmPoster sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", film.poster]]];
    _filmTitle.text = film.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
