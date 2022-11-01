% Original(Real Image)
subplot(4,3,1)
imshow(hazy_image)
title("Hazy Image - Input")

%Finding Dark Channel
subplot(4,3,2)
imshow(J_DARK)
title("Dark Channel")

%Finding Transmission
subplot(4,3,3)
imshow(t)
title("Transmission Estimate")

%Finding Haze-Free Image
subplot(4,3,4)
imshow(uint8(J))
title("Recovered Image")

%Finding Refined Transmission using Guided Filter
subplot(4,3,5)
imshow(FG)
title("Refined Transmission Estimate using Guided Filter")

%Finding Refined Haze-Free Image
subplot(4,3,6)
imshow(uint8(J_Refined))
title("Refined Image")

%NPEA on refined image
subplot(4,3,7)
imshow(INPEA)
title("NPEA on Refined Image")

%NPEA on real image
subplot(4,3,8)
imshow(I)
title("NPEA on Real Image")

%CLAHE on NPEA
subplot(4,3,9)
imshow(JnpeaReal)
title("CLAHE on NPEA of Real Image")

%CLAHE on Real Image
subplot(4,3,10)
imshow(Jclahe)
title("CLAHE on Real Image")

%CLAHE on Refined Image
subplot(4,3,11)
imshow(Jref)
title("CLAHE on Refined Image")

%CLAHE on NPEA Image
subplot(4,3,12)
imshow(JNPEA)
title("CLAHE on NPEA of Refined Image")
