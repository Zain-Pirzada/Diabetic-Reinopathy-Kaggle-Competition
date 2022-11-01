hazy_image=imread("E:\FYP\Extra\DATA\DATASETS\0\41_right.jpeg");
[r,c,m]=size(hazy_image);
subplot(4,3,1)
imshow(hazy_image)
title("Hazy Image - Input")
hazetic = tic;
%Finding Dark Channel
hazy_image=double(hazy_image);
hazy_image=hazy_image./255;
J_DARK = Dark_Channel(hazy_image);
subplot(4,3,2)
imshow(J_DARK)
title("Dark Channel")

%Finding Atmospheric Light
A = Estimating_Atmospheric_Light(hazy_image,J_DARK);

%Finding Transmission
t=Transmission_Estimate(hazy_image,A);
subplot(4,3,3)
imshow(t)
title("Transmission Estimate")

%Finding Haze-Free Image
J=Recovering_Scene_Radiance(hazy_image,A,t);
J=J.*255;
subplot(4,3,4)
imshow(uint8(J))
title("Recovered Image")

%Finding Refined Transmission using Guided Filter
window_size=75;
FG=Guided_Filter(t,hazy_image,window_size);
subplot(4,3,5)
imshow(FG)
title("Refined Transmission Estimate using Guided Filter")

%Finding Refined Haze-Free Image
J_Refined=Recovering_Scene_Radiance(hazy_image,A,FG);
J_Refined=J_Refined.*255;
subplot(4,3,6)
imshow(uint8(J_Refined))
title("Refined Image")
hazet = toc(hazetic)

%NPEA on refined image
npetic = tic;
INPEA = NPEA(J_Refined);
subplot(4,3,7)
imshow(INPEA)
title("NPEA on Refined Image")
npetoc = toc(npetic)

%NPEA on real image
I = NPEA(hazy_image);
subplot(4,3,8)
imshow(I)
title("NPEA on Real Image")

%CLAHE on NPEA
LAB = rgb2lab(I);
L = LAB(:,:,1)/100;
L = adapthisteq(L,'NumTiles',[16 16],'ClipLimit',0.5);
LAB(:,:,1) = L*100;
JnpeaReal = lab2rgb(LAB);
subplot(4,3,9)
imshow(JnpeaReal)
title("CLAHE on NPEA of Real Image")

%CLAHE on Real Image
clahetic = tic;
LAB = rgb2lab(hazy_image);
L = LAB(:,:,1)/100;
L = adapthisteq(L,'NumTiles',[16 16],'ClipLimit',0.5);
LAB(:,:,1) = L*100;
Jclahe = lab2rgb(LAB);
subplot(4,3,10)
imshow(Jclahe)
title("CLAHE on Real Image")
clahetoc = toc(clahetic)

%CLAHE on Refined Image
LAB = rgb2lab(J_Refined);
L = LAB(:,:,1)/100;
L = adapthisteq(L,'NumTiles',[16 16],'ClipLimit',0.5);
LAB(:,:,1) = L*100;
Jref = lab2rgb(LAB);
subplot(4,3,11)
imshow(Jref)
title("CLAHE on Refined Image")

%CLAHE on NPEA Image
LAB = rgb2lab(INPEA);
L = LAB(:,:,1)/100;
L = adapthisteq(L,'NumTiles',[16 16],'ClipLimit',0.5);
LAB(:,:,1) = L*100;
JNPEA = lab2rgb(LAB);
subplot(4,3,12)
imshow(JNPEA)
title("CLAHE on NPEA Image")