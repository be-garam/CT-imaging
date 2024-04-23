 disp('Simple backprojection')
if 1~=exist('lamin')
 
  lamin = zeros(nx,ny);  
  for ia = 1:na
    disp(sprintf('angle %g of %g', ia, na));   
    projection_ia=sinogram(:,ia);   %each angle projection
    projection_smear=repmat (projection_ia,1,128);  %smear current angle in 128*128
   rot= imrotate(projection_smear', ia*180/256, 'bicubic','crop');  %256 projections correspond to 180 deg. Hence ia*180/256 for current projection angle
    lamin=lamin+rot;     %lamin needs to be 128*128 = so 1st arg in imrotate should be same dimension
  end
%
% Display Image
%
  figure(4)
  imagesc(x, y, lamin); colormap('gray'); axis('image')
  title('Simple Backprojection Image')
  xlabel('mm')  %x and y in imagesc gives us scalar limits in mm
  ylabel('mm')
end
