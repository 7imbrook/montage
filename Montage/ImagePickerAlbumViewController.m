//
//  ImagePickerAlbumViewController.m
//  Montage
//
//  Created by Michael Timbrook on 8/10/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "ImagePickerAlbumViewController.h"
#import "ImagePickerAlbumCell.h"

@implementation ImagePickerAlbumViewController
{
    NSMutableArray *_albums;
    __strong ALAssetsLibrary *_library;
}

- (void)viewDidLoad
{
    
    _tableView.dataSource = self;
    
    _albums = [NSMutableArray new];
    _library = [ALAssetsLibrary new];
    [_library enumerateGroupsWithTypes:ALAssetsGroupAlbum | ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group == nil)
            return;
        [_albums addObject:group];
        [_tableView reloadData];
    } failureBlock:^(NSError *error) {
        // Handle lack of photo access here, prompt user to update settings
        NSLog(@"Cannot access photos library");
    }];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImagePickerAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"album"];
    ALAssetsGroup *album = _albums[indexPath.row];
    
    cell.albumName.text = [album valueForProperty:ALAssetsGroupPropertyName];
    cell.imageView.image = [UIImage imageWithCGImage:album.posterImage];
    
    return cell;
}

@end
