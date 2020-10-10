//
//  SystemImagePickerViewController.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/4/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ZHSystemCameraViewController.h"
#import <Photos/Photos.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ZHSystemCameraViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *takePhoto;
@property (nonatomic, strong) UIButton *cameraBtn;
//@property (nonatomic, strong) <#Class#> *<#object#>;

@end

@implementation ZHSystemCameraViewController
{
    NSInteger _cameraType;
}
- (instancetype)init {
    return [self initWithType:0];
}
- (instancetype)initWithType:(NSInteger)type {
    
    self = [super init];
    if (self) {
        
        _cameraType = 0;
        self.allowsEditing = YES;
        self.delegate = self;
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        /// 图片(默认是图片)
        self.mediaTypes = @[(__bridge NSString*)kUTTypeImage];
        self.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        
        /// 视频
        if (type == 1) {
            _cameraType = 1;
            self.mediaTypes = @[(__bridge NSString*)kUTTypeMovie];
            self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
//            self.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
        }
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"frame = %@",NSStringFromCGRect(self.view.frame));
    
//    self.showsCameraControls = NO;
    self.overlayView = [[UIView alloc] init];
    self.overlayView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
//    self.cameraOverlayView = self.overlayView;
    
    /// 拍照按钮
    self.takePhoto = [[UIButton alloc] init];
    [self.overlayView addSubview:self.takePhoto];
    if (_cameraType == 0) {
        
    } else {
        
    }
    
    /// 关闭按钮
    self.closeBtn = [[UIButton alloc] init];
    [self.overlayView addSubview:self.closeBtn];
    [self.closeBtn setTitle:@"" forState:(UIControlStateNormal)];
    
    /// 摄像头按钮
    self.cameraBtn = [[UIButton alloc] init];
    [self.overlayView addSubview:self.cameraBtn];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.overlayView.frame = self.view.bounds;
    if (_cameraType == 0) {
        CGFloat scale = self.view.bounds.size.height/self.view.bounds.size.width * (4/3);
        self.cameraViewTransform = CGAffineTransformMakeScale(scale, scale);
    }
    
    self.takePhoto.frame = CGRectMake(0, 0, 60, 60);
    self.takePhoto.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2.0, CGRectGetHeight(self.view.bounds) - 60);
    self.closeBtn.frame = CGRectMake(0, 0, 60, 60);
    self.closeBtn.center = CGPointMake(60, CGRectGetMidY(self.takePhoto.frame));
    self.cameraBtn.frame = CGRectMake(0, 0, 60, 60);
    self.cameraBtn.center = CGPointMake(CGRectGetWidth(self.view.frame) - 60, CGRectGetMidY(self.takePhoto.frame));
    
}


#pragma mark --- priviceMethod

- (void)closeAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)takePhotoAction:(UIButton *)sender {
    
    if (_cameraType == 0) {
        [self takePicture];
    } else {
        sender.selected = !sender.selected;
        
    }
    
}
- (void)changeCameraAction:(UIButton *)sender {
    
}

#pragma mark ---- UIImagePickerControllerDelegate<NSObject>

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        //获取源图像（未经裁剪）
        UIImage *orImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        //获取裁剪后的图像
        UIImage *image = info[UIImagePickerControllerEditedImage];
        
        UIImageWriteToSavedPhotosAlbum(orImage, self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
        
    }
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        
        /// 这个文件再沙盒的tmp目录下面。
        NSURL *mediaUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        NSData *data = [NSData dataWithContentsOfURL:mediaUrl];
        AVURLAsset *asset = [AVURLAsset URLAssetWithURL:mediaUrl options:@{}];
        
        UISaveVideoAtPathToSavedPhotosAlbum(mediaUrl.path, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        
        NSLog(@"%ld",data.length);
    }
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
    if (!error) {
        
    }
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
